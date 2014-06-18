- in codelab_list.dart, add this:

    @observable List<Codelab> codelabs = toObservable([]);
    
- Add this code to reset the form:

    resetForm() {
      newCodelab = new Codelab();
      newCodelab.level = defaultLevel;
    }
    
- Add this function to actually add the codelab to the collection

    addCodelab(Event e, var detail, Node sender) {
      e.preventDefault();
      codelabs.add(detail['codelab']);
      resetForm();
    }

- in codelab_list.html, modify the code for <codelab-form> like this:
 
     <div on-codelabvalidated="{{addCodelab}}">
      <codelab-form codelab="{{newCodelab}}"></codelab-form>
    </div>
    
- need representation for a codelab object. In codelab_element.dart, add:
 
    @published Codelab codelab;
    
- In codelab_element.html, add the following above the closing </template> tag:
    <div>
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
      </div>
    </div>
    
- in codelab_list.html add code to show all codelabs:

    <div>
      <template repeat="{{codelab in codelabs}}">
        <codelab-element codelab="{{codelab}}"></codelab-element>
      </template>
    </div>
 
 - you can finally add codelabs!  Go ahead, try the spiffy new webpage you've
 just created.
 
 