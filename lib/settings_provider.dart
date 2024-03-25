import 'dart:math';

class SettingsProvider {
  final List<String> colorSettings = ['red', 'green', 'blue'];
  final List<String> itemSettings = ['dialog', 'snap'];
  final List<String> transitionSettings = ['top', 'right', 'bottom'];

  String? color;
  String? item;
  String? transition;

  void generateSettings() {
    // Set randow settings from the lists
    var random = Random();
    color = colorSettings[random.nextInt(colorSettings.length)];
    item = itemSettings[random.nextInt(itemSettings.length)];
    transition = transitionSettings[random.nextInt(transitionSettings.length)];
  }
}
