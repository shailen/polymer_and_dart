import 'package:polymer/polymer.dart';
import 'models.dart' show Codelab;
import 'dart:html' show CustomEvent, Event, Node;

@CustomTag('codelab-form')
class CodelabFormElement extends PolymerElement {
  // TODO: change codelab constructor to make title optional.
  @published Codelab codelab;

  CodelabFormElement.created() : super.created();

  create(Event event, Object detail, Node sender) {
    event.preventDefault();
    // TODO: Add validation here. Bail on failure.

    // TODO: better name.
    dispatchEvent(new CustomEvent('codelabcreated',
        detail: {'codelab': codelab}));
  }

  cancel(Event event, Object detail, Node sender) {
    print("inside dispatch cancel");
    event.preventDefault();
    dispatchEvent(new CustomEvent('formnotneeded'));
  }
}
