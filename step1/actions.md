- Add to model.dart:

    static const List<String> LEVELS = const ['easy', 'intermediate', 'advanced'];
    static const MIN_TITLE_LENGTH = 10;
    static const MAX_TITLE_LENGTH = 30;
    static const MAX_DESCRIPTION_LENGTH = 140;
  
    @observable String title;
    @observable String description;
    @observable String level;
  
    Codelab([this.title = "", this.description = ""]);

- Add to codelab_form.dart:
 
    @published Codelab codelab;
    
- Modify codelab_form.html (add the attributes part):
  
    <polymer-element name="codelab-form" attributes="codelab">
    
- Add to codelab_form.dart:

    List<String> get allLevels => Codelab.LEVELS;
    int get minTitleLength =>  Codelab.MIN_TITLE_LENGTH;
    int get maxTitleLength => Codelab.MAX_TITLE_LENGTH;
    int get maxDescriptionLength => Codelab.MAX_DESCRIPTION_LENGTH;
    
   
- Add to codelab_form.html:

    <div class="field">
      <textarea placeholder="Add title" value="{{codelab.title}}">
      </textarea>
      <div>
        <span class="chars-left">{{maxTitleLength - codelab.title.length}}</span>
      </div>
    </div>
    <div class="field">
      <textarea placeholder="Add description" value="{{codelab.description}}">
      </textarea>
      <div>
        <span class="chars-left">
          {{maxDescriptionLength - codelab.description.length}}
        </span>
      </div>
    </div>
    <div class="field">
      <label>Level: </label>
      <select value="{{codelab.level}}">
        <option template repeat="{{level in allLevels}}">
          {{level}}
        </option>
      </select>
    </div>
    <div>
      <button type="submit">Submit</button>
    </div>

- Make class CodelabList look like this:

    @CustomTag('codelab-list')
    class CodelabList extends PolymerElement {
       @observable Codelab newCodelab = new Codelab();
    
       String get defaultLevel => Codelab.LEVELS[1];
    
       CodelabList.created() : super.created() {
         newCodelab.level = defaultLevel;
       }
    }
    
- Add to codelab_list.html:
    <div>
      <codelab-form codelab="{{newCodelab}}"></codelab-form>
    </div>