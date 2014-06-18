- Add the following to codelab_form.dart:

    @observable String titleErrorMessage = '';
    @observable String descriptionErrorMessage = '';
    
 - Add a title validator
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

- Add a description validator
    bool validateDescription() {
      if (codelab.description.length > maxDescriptionLength) {
        descriptionErrorMessage = "Description cannot be more than "
            "$maxDescriptionLength characters.";
        return false;
      }
      descriptionErrorMessage = '';
      return true;
    }
 
- Add code to call the validators:

    validateCodelab(Event event, Object detail, Node sender) {
      event.preventDefault();
      if (validateTitle() && validateDescription()) {
        dispatchEvent(new CustomEvent('codelabvalidated',
            detail: {'codelab': codelab}));
      }
    }
    
- in codelab_forms.html, add:
 
    on-submit="{{validateCodelab}}" to the <form>
 
- then add this title validator to the title textarea:
    
    on-keyup="{{validateTitle}}"
    
- then add this error span:
 
    <span class="error" hidden?="{{titleErrorMessage.isEmpty}}">
      {{titleErrorMessage}}
    </span>
          
          
- add to the description textarea:
   
    on-keyup="{{validateDescription}}"
 
- error span
 
   <span class="error" hidden?="{{descriptionErrorMessage.isEmpty}}">
    {{descriptionErrorMessage}}
  </span>

- notice the error messages (title too short, title too long, description too long)

- notice you cannot submit the form

- we still cannot see our codelab. Let's fix that in the next step.
 