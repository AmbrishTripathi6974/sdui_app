import 'component_model.dart';
import '../actions/action_model.dart';

class TitleComponent extends ComponentModel {
  final String title;

  TitleComponent(this.title);

  @override
  Map<String, dynamic> toJson() {
    return {
      "runtimeType": "title",
      "title": title,
    };
  }
}

class SpacerComponent extends ComponentModel {
  final double height;

  SpacerComponent(this.height);

  @override
  Map<String, dynamic> toJson() {
    return {
      "runtimeType": "spacer",
      "height": height,
    };
  }
}

class ButtonComponent extends ComponentModel {
  final String label;
  final ActionModel action;

  ButtonComponent({
    required this.label,
    required this.action,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "runtimeType": "button",
      "label": label,
      "action": action.toJson(),
    };
  }
}
