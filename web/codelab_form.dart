import 'package:polymer/polymer.dart';
import 'models.dart' show Codelab;
import 'dart:html' show CustomEvent, Event, Node;

@CustomTag('codelab-form')
class CodelabFormElement extends PolymerElement {
  // TODO: change codelab constructor to make title optional.
  @published Codelab codelab;
  @observable List<String> get allLevels => toObservable(Codelab.LEVELS);

  int get minTitleLength =>  Codelab.MIN_TITLE_LENGTH;
  int get maxTitleLength => Codelab.MAX_TITLE_LENGTH;
  int get maxDescriptionLength => Codelab.MAX_DESCRIPTION_LENGTH;

  @observable String formErrorMessage = '';
  @observable String titleErrorMessage = '';
  @observable String descriptionErrorMessage = '';

  CodelabFormElement.created() : super.created() {}

  bool validateTitle() {
    if (codelab.title.length < minTitleLength ||
        codelab.title.length > maxTitleLength) {
      titleErrorMessage = "Title must be between $minTitleLength and "
          "$maxTitleLength characters.";
      return false;
    }
    titleErrorMessage = '';
    return true;
  }

  bool validateDescription() {
    if (codelab.description.length > maxDescriptionLength) {
      descriptionErrorMessage = "Description cannot be more than "
          "$maxDescriptionLength characters.";
      return false;
    }
    descriptionErrorMessage = '';
    return true;
  }

  // createOrUpdate() ?
  create(Event event, Object detail, Node sender) {
    event.preventDefault();
    if (validateTitle() && validateDescription()) {
      formErrorMessage = '';
      // TODO: better name.
      dispatchEvent(new CustomEvent('codelabcreated',
          detail: {'codelab': codelab}));
    } else {
      formErrorMessage = 'Error: codelab not saved.';
    }
  }

  cancel(Event event, Object detail, Node sender) {
    event.preventDefault();
    dispatchEvent(new CustomEvent('formnotneeded'));
  }
}
