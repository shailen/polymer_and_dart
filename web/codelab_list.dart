import 'package:polymer/polymer.dart';
import 'models.dart' show Codelab;
import 'dart:html';

@CustomTag('codelab-list')
class CodelabList extends PolymerElement {

  @observable Codelab newCodelab = new Codelab('');
  @observable List<Codelab> codelabs = toObservable([]);
  @observable get filters {
    List<String> f = ['all'];
    f.addAll(Codelab.LEVELS);
    return f;
  }
  @observable String filterValue = 'all';
  @observable List<Codelab> filteredCodelabs = toObservable([]);

  CodelabList.created() : super.created() {
    // Set a default level.
    newCodelab.level = Codelab.LEVELS[1];
    filteredCodelabs = codelabs;
  }

  filter() {
    if (filterValue == 'all') {
      filteredCodelabs = codelabs;  // By value????????
      return;
    }
    filteredCodelabs = codelabs.where((codelab) {
      return codelab.level == filterValue;
    }).toList();
  }

  addCodelab(Event e, var detail, Node sender) {
    codelabs.add(detail['codelab']);
    newCodelab = new Codelab('');
  }

  codelabsChanged() {
    filter();
  }

  resetNewCodelabForm(Event e, var detail, Node sender) {
    newCodelab = new Codelab('');
  }

  deleteCodelab(Event e, var detail, Node sender) {
    var codelab = detail['codelab'];
    codelabs.remove(codelab);
  }
}