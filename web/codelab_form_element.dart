import 'package:polymer/polymer.dart';
import 'models.dart' show Codelab;
import 'dart:html' show CustomEvent, Event, Node;

@CustomTag('codelab-form')
class CodelabFormElement extends PolymerElement {
  // TODO: change codelab constructor to make title optional.
  @observable Codelab codelab = new Codelab('');

  CodelabFormElement.created() : super.created();

  dispatchCreate(Event event, Object detail, Node sender) {
    event.preventDefault();
    // TODO: Add validation here. Bail on failure.

    dispatchEvent(new CustomEvent('codelabcreated',
        detail: {'codelab': codelab}));
    codelab = new Codelab('');
  }

  dispatchCancel(Event event, Object detail, Node sender) {
    codelab = new Codelab('');
  }
}
