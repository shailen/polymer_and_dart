import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show CustomEvent, Event, Node;

/*
 * The class for creating or updating a codelab. Performs validation based on
 * a codelab based on validation rules defined in the model.
 */
@CustomTag('codelab-form')
class CodelabFormElement extends PolymerElement {
  /*
   * The Codelab object modified by this form.
   */
  @published Codelab codelab;

  /*
   * Getters that make Codelab static values accessible in the template.
   */
  @observable List<String> get allLevels => toObservable(Codelab.LEVELS);
  int get minTitleLength =>  Codelab.MIN_TITLE_LENGTH;
  int get maxTitleLength => Codelab.MAX_TITLE_LENGTH;
  int get maxDescriptionLength => Codelab.MAX_DESCRIPTION_LENGTH;

  /*
   * Variables used in displaying error messages.
   */
  @observable String formErrorMessage = '';
  @observable String titleErrorMessage = '';
  @observable String descriptionErrorMessage = '';

  CodelabFormElement.created() : super.created() {}

  /*
   * Validates the codelab title. If title is not valid, sets error message and
   * returns false. Otherwise, removes error message and returns true.
   */
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

  /*
   * Validates the codelab description. If description is not valid, sets error
   * message and returns false. Otherwise, removes error message and returns
   * true.
   */
  bool validateDescription() {
    if (codelab.description.length > maxDescriptionLength) {
      descriptionErrorMessage = "Description cannot be more than "
          "$maxDescriptionLength characters.";
      return false;
    }
    descriptionErrorMessage = '';
    return true;
  }

  /*
   * Dispatches a custom event if a codelab passes validation. Otherwise, sets
   * the form error message.
   */
  validateCodelab(Event event, Object detail, Node sender) {
    event.preventDefault();
    if (validateTitle() && validateDescription()) {
      formErrorMessage = '';
      // TODO: better name.
      dispatchEvent(new CustomEvent('codelabvalidated',
          detail: {'codelab': codelab}));
    } else {
      formErrorMessage = 'Error: codelab not saved.';
    }
  }

  /*
   * Dispatches a custom event when a form is no longer needed.
   */
  cancelForm(Event event, Object detail, Node sender) {
    event.preventDefault();
    dispatchEvent(new CustomEvent('formnotneeded'));
  }
}
