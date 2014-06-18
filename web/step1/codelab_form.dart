import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show CustomEvent, Event, Node;


@CustomTag('codelab-form')
class CodelabFormElement extends PolymerElement {

  @published Codelab codelab;

  List<String> get allLevels => Codelab.LEVELS;
  int get minTitleLength =>  Codelab.MIN_TITLE_LENGTH;
  int get maxTitleLength => Codelab.MAX_TITLE_LENGTH;
  int get maxDescriptionLength => Codelab.MAX_DESCRIPTION_LENGTH;

  CodelabFormElement.created() : super.created() {
    // ...
  }
  // ...
}