import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html';

@CustomTag('codelab-list')
class CodelabList extends PolymerElement {
  static const ALL = "all";
  @observable Codelab newCodelab = new Codelab();
  @observable List<Codelab> codelabs = toObservable([]);
  @observable get filters {
    List<String> _filters = [ALL];
    _filters.addAll(Codelab.LEVELS);
    return _filters;
  }
  @observable String filterValue = ALL;
  @observable List<Codelab> filteredCodelabs = toObservable([]);

  CodelabList.created() : super.created() {
    // Set a default level. Assume most codelabs are 'intermediate'.
    newCodelab.level = Codelab.LEVELS[1];
    filteredCodelabs = codelabs;
  }

  /*
   * Calculates the codelabs to display when a filter is used.
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
   * Adds a codelab to `codelabs` and resest the new codelab form.
   */
  addCodelab(Event e, var detail, Node sender) {
    codelabs.add(detail['codelab']);
    resetNewCodelabForm();
  }

  /*
   * Refreshes `filteredCodelabs` every time `codelabs` changes.
   */
  codelabsChanged() {
    filter();
  }

  /*
   * Replaces the existing `newCodelab` object with a new one, resetting form
   * values.
   */
  resetNewCodelabForm() {
    newCodelab = new Codelab();
  }

  /*
   * Removes a codelab from `codelabs`.
   */
  deleteCodelab(Event e, var detail, Node sender) {
    var codelab = detail['codelab'];
    codelabs.remove(codelab);
  }
}