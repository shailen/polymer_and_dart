library polymer_and_dart.web.models;

import 'package:polymer/polymer.dart';

class Codelab extends Observable {
  static const List<String> LEVELS = const ['Easy', 'Intermediate', 'Advanced'];
  static const MIN_TITLE_LENGTH = 6;
  static const MAX_TITLE_LENGTH = 20;
  static const MAX_DESCRIPTION_LENGTH = 100;

  @observable String title;
  @observable String description;
  @observable List<String> topics = [];
  @observable String level;

  Codelab([this.title="", this.description=""]);
}