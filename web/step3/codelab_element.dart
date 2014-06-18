import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show Event, Node, CustomEvent;

@CustomTag('codelab-element')
class CodelabElement extends PolymerElement {
  @published Codelab codelab;

  CodelabElement.created(): super.created() {}

}