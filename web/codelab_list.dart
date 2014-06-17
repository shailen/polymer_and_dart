import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html';

/*
 * Class to represent a collection of Codelab objects.
 */
@CustomTag('codelab-list')
class CodelabList extends PolymerElement {
  static const ALL = "all";
  /*
   * Field for a new Codelab object.
   */
  @observable Codelab newCodelab = new Codelab();

  /*
   * Collection of codelabs. The source of truth for all codelabs in this app.
   */
  @observable List<Codelab> codelabs = toObservable([]);

  /*
   * List of filter values. Includes the levels defined in the model, as well
   * as a filter to return all codelabs.
   */
  @observable get filters {
    List<String> _filters = [ALL];
    _filters.addAll(Codelab.LEVELS);
    return _filters;
  }

  /*
   * String that stores the value used to filter codelabs
   */
  @observable String filterValue = ALL;

  /*
   * The list of filtered codelabs.
   */
  @observable List<Codelab> filteredCodelabs = toObservable([]);

  CodelabList.created() : super.created() {
    // Set a default level. Assume most codelabs are 'intermediate'.
    newCodelab.level = Codelab.LEVELS[1];
    filteredCodelabs = codelabs;
  }

  /*
   * Calculates the codelabs to display when using a filter.
   */
  filter() {
    if (filterValue == ALL) {
      filteredCodelabs = codelabs;
      return;
    }
    filteredCodelabs = codelabs.where((codelab) {
      return codelab.level == filterValue;
    }).toList();
  }

  /*
   * Adds a codelab to the codelabs list and resets the new codelab form. This
   * triggers codelabsChanged().
   */
  addCodelab(Event e, var detail, Node sender) {
    codelabs.add(detail['codelab']);
    resetNewCodelabForm();
  }

  /*
   * Refreshes the filtered codelabs list every time the codelabs list changes.
   */
  codelabsChanged() {
    filter();
  }

  /*
   * Replaces the existing new Codelab, causing the new codelab form to reset.
   */
  resetNewCodelabForm() {
    newCodelab = new Codelab();
  }

  /*
   * Removes a codelab from the codelabs list. This triggers codelabsChanged().
   */
  deleteCodelab(Event e, var detail, Node sender) {
    var codelab = detail['codelab'];
    codelabs.remove(codelab);
  }
}