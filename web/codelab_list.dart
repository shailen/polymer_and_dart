import 'package:polymer/polymer.dart';
import 'models.dart' show Codelab;
import 'dart:html';

@CustomTag('codelab-list')
class CodelabList extends PolymerElement {
  @observable Codelab newCodelab = new Codelab('');
  @published List<Codelab> codelabs = toObservable([]);
  CodelabList.created() : super.created() {
    // Set a default level.
    newCodelab.level = Codelab.LEVELS[1];
  }

  attached() {
    super.attached();
    // Seed data goes here.
    // codelabs.addAll([new Codelab('codelab one'), new Codelab('codelab two')]);
  }

  addCodelab(Event e, var detail, Node sender) {
    codelabs.add(detail['codelab']);
    newCodelab = new Codelab('');
  }

  resetNewCodelabForm(Event e, var detail, Node sender) {
    newCodelab = new Codelab('');
  }

  deleteCodelab(Event e, var detail, Node sender) {
    var codelab = detail['codelab'];
    codelabs.remove(codelab);
  }
}