- in codelab_element.dart, add this to the class right after @published:

    @observable bool editing = false;
    Codelab _cachedCodelab;

- in the same file, add these methods after created():

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

- in codelab_element.html, add the following between </style> and </template>:

    <div on-formNotNeeded="{{cancelEditing}}"
         on-codelabvalidated="{{updateCodelab}}">
      <template if="{{!editing}}">
        <div class="codelab">
          <div class="field">
            <h2>{{codelab.title}}</h2>
          </div>

          <div class="field">
            <p>{{codelab.description}}</p>
          </div>

          <div class="field">
            <p><span>Level: </span>{{codelab.level}}</p>
          </div>

          <div class="field">
            <span on-click="{{startEditing}}" class="small">Edit</span>
          </div>
        </div>
      </template>
      <template if="{{editing}}">
        <codelab-form codelab="{{codelab}}"></codelab-form>
      </template>
    </div>


- in codelab_form.dart, add this function to the bottom of the class:

    cancelForm(Event event, Object detail, Node sender) {
      event.preventDefault();
      titleErrorMessage = '';
      descriptionErrorMessage = '';
      dispatchEvent(new CustomEvent('formnotneeded'));
    }
    
- in codelab_form.html, modify the <div> containing the Submit button so it looks like this: 
    <div>
      <button type="submit">Submit</button>
      <button type="button" on-click="{{cancelForm}}">Cancel</button>
    </div>

- in codelab_list.html, add on-formnotneeded so that the <div> after the </style>
looks like this:

    <div on-codelabvalidated="{{addCodelab}}"
         on-formnotneeded="{{resetForm}}">
      <codelab-form codelab="{{newCodelab}}"></codelab-form>
    </div>
         
- you can now edit.
- validation works even while editing
- if you cancel, you codelab object isn't changed


