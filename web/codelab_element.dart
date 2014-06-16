import 'package:polymer/polymer.dart';
import 'models.dart' show Codelab;
import 'dart:html';

@CustomTag('codelab-element')
class CodelabElement extends PolymerElement {
  @published Codelab codelab;
  @observable bool editing = false;
  Codelab _cachedCodelab;

  CodelabElement.created(): super.created() {}

  updateCodelab(Event e, var detail, Node sender) {
    e.preventDefault();
    editing = false;
  }

  cancelEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    codelab.title = _cachedCodelab.title;
    editing = false;
  }

  startEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    // TODO: fix constructor.
    _cachedCodelab = new Codelab('');
    // Create Codelab.copy()
    _cachedCodelab.title = codelab.title;
    editing = true;
  }

  delete(Event e, var detail, Node sender) {
    e.preventDefault();
    dispatchEvent(new CustomEvent('deletecodelab',
        detail: {'codelab': codelab}));
  }
}
