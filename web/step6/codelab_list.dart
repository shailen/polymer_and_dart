import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show Event, Node;

@CustomTag('codelab-list')
class CodelabList extends PolymerElement {
  static const ALL = "all";
  @observable Codelab newCodelab = new Codelab();

  @observable List<Codelab> codelabs = toObservable([]);
  final List<String> filters = [ALL]..addAll(Codelab.LEVELS);
  @observable String filterValue = ALL;
  @observable List<Codelab> filteredCodelabs = toObservable([]);

  String get defaultLevel => Codelab.LEVELS[1];

  CodelabList.created() : super.created() {
    filteredCodelabs = codelabs;
    newCodelab.level = defaultLevel;
  }

   resetForm() {
     newCodelab = new Codelab();
     newCodelab.level = defaultLevel;
   }

   addCodelab(Event e, var detail, Node sender) {
     e.preventDefault();
     codelabs.add(detail['codelab']);
     resetForm();
   }

   deleteCodelab(Event e, var detail, Node sender) {
     var codelab = detail['codelab'];
     codelabs.remove(codelab);
   }

  filter() {
     if (filterValue == ALL) {
       filteredCodelabs = codelabs;
       return;
     }
     filteredCodelabs = codelabs.where((codelab) {
       return codelab.level == filterValue;
     }).toList();
   }

  codelabsChanged() {
    filter();
  }
}