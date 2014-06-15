import 'package:polymer/polymer.dart';
import 'models.dart' show Codelab;
import 'dart:html';

@CustomTag('codelab-list')
class CodelabList extends PolymerElement {
  @published List<Codelab> codelabs = toObservable([]);

  CodelabList.created() : super.created() {}

  attached() {
    super.attached();
    // Seed data goes here.
    codelabs.addAll([new Codelab('codelab one'), new Codelab('codelab two')]);
  }

  addCodelab(Event e, var detail, Node sender) {
    window.console.log(detail);
    codelabs.add(detail['codelab']);
  }
}