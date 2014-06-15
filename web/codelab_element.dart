import 'package:polymer/polymer.dart';
import 'models.dart' show Codelab;

@CustomTag('codelab-element')
class CodelabElement extends PolymerElement {
  @published Codelab codelab = new Codelab('First Codelab');
  CodelabElement.created(): super.created() {}
}
