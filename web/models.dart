library polymer_and_dart.web.models;

import 'package:polymer/polymer.dart';

class Codelab extends Observable {
  @observable String title;
  Codelab(this.title);
}