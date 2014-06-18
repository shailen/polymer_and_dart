- in codelab_list.dart, add this as the first line in the class:

    static const ALL = "all";
    
- after codelabs = , add the following:

    final List<String> filters = [ALL]..addAll(Codelab.LEVELS);
    @observable String filterValue = ALL;
    @observable List<Codelab> filteredCodelabs = toObservable([]);
    
- change created(), so it looks like this:

    CodelabList.created() : super.created() {
      filteredCodelabs = codelabs;
      newCodelab.level = defaultLevel;
    }
    
- define filter():

    filter() {
      if (filterValue == ALL) {
        filteredCodelabs = codelabs;
        return;
      }
      filteredCodelabs = codelabs.where((codelab) {
        return codelab.level == filterValue;
      }).toList();
    }
    
    
- define codelabsChanged():

codelabsChanged() {
  filter();
}


- in codelab_list.html, add this <div> immediately after the </style>:

<div>
  <label>Filter: </label>
  <select value="{{filterValue}}" on-change="{{filter}}">
    <option template repeat="{{filter in filters}}">
      {{filter}}
    </option>
  </select>
</div>
    
- use <template repeat="{{codelab in filteredCodelabs}}">

<div>
  <label>Filter: </label>
  <select value="{{filterValue}}" on-change="{{filter}}">
    <option template repeat="{{filter in filters}}">
      {{filter}}
    </option>
  </select>
</div>
<div on-codelabvalidated="{{addCodelab}}"
     on-formnotneeded="{{resetForm}}">
  <codelab-form codelab="{{newCodelab}}"></codelab-form>
</div>
<div on-deletecodelab="{{deleteCodelab}}"
     on-levelchanged="{{filter}}">
  <template repeat="{{codelab in filteredCodelabs}}">
    <codelab-element codelab="{{codelab}}"></codelab-element>
  </template>
</div>
    
- in codelab_element.dart, modify `updateCodelab()` so that it looks like this:

    updateCodelab(Event e, var detail, Node sender) {
      e.preventDefault();
      if (_cachedCodelab.level != codelab.level) {
        dispatchEvent(new CustomEvent('levelchanged'));
      }
      editing = false;
    }
    
