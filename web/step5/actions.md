- add this method to the bottom of the class in codelab_element.dart:

    deleteCodelab(Event e, var detail, Node sender) {
      e.preventDefault();
      dispatchEvent(new CustomEvent('deletecodelab',
          detail: {'codelab': codelab}));
    }
    
 - add a 'delete' link next to 'edit' in codelab_element.html. The <div> should 
 now look like this:
 
    <div class="field">
      <span on-click="{{startEditing}}" class="small">Edit</span> |
      <span on-click="{{deleteCodelab}}" class="small">Delete</span>
    </div>


- in codelab_list.dart, add this method: 

    deleteCodelab(Event e, var detail, Node sender) {
      var codelab = detail['codelab'];
      codelabs.remove(codelab);
    }
    
- codelab_list.html, handle on-deletecodelab. The <div> containing the
<tempate repeat> should look like this:

    <div on-deletecodelab="{{deleteCodelab}}">
      <template repeat="{{codelab in codelabs}}">
        <codelab-element codelab="{{codelab}}"></codelab-element>
      </template>
    </div>
  
- now you can delete any codelab. Try it out!

