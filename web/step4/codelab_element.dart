import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show Event, Node, CustomEvent;

@CustomTag('codelab-element')
class CodelabElement extends PolymerElement {
  @published Codelab codelab;
  @observable bool editing = false;
  Codelab _cachedCodelab;

  CodelabElement.created(): super.created() {}

  updateCodelab(Event e, var detail, Node sender) {
       e.preventDefault();
       if (_cachedCodelab.level != codelab.level) {
         dispatchEvent(new CustomEvent('levelchanged'));
       }
       editing = false;
     }

     startEditing(Event e, var detail, Node sender) {
       e.preventDefault();
       _cachedCodelab = new Codelab();
       copyCodelab(_cachedCodelab, codelab);
       editing = true;
     }

     cancelEditing(Event e, var detail, Node sender) {
       e.preventDefault();
       copyCodelab(codelab, _cachedCodelab);
       editing = false;
     }

     copyCodelab(source, destination) {
       source.title = destination.title;
       source.description = destination.description;
       source.level = destination.level;
     }

}