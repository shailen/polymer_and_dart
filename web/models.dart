library polymer_and_dart.web.models;

import 'package:polymer/polymer.dart';

class Codelab extends Observable {
  static const List<String> TOPICS = const [
      'Accessibility', 'Android', 'Chrome / Web', 'Cloud Services', 'Dart',
      'Games', 'Go', 'Growth','Location', 'Monetization', 'Media',
      'Performance', 'Polymer', 'Tools', 'UX', 'Wearables'];
  static const List<String> THEMES = const ['Design', 'Develop', 'Distribute'];
  @observable String title;
  @observable String description;
  @observable String authors;
  @observable List<String> topics = [];
  @observable String theme;
  Codelab([this.title]);
}