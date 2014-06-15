import 'package:polymer/polymer.dart';
import 'models.dart' show Codelab;

@CustomTag('codelab-element')
class CodelabElement extends PolymerElement {
  @published Codelab codelab;
  CodelabElement.created(): super.created() {}
}
