abstract class ScreenModel {
  Map<String, dynamic> toJson();
}

class VerticalScreenModel extends ScreenModel {
  final String screenTitle;
  final List<dynamic> components;

  VerticalScreenModel({
    required this.screenTitle,
    required this.components,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "runtimeType": "verticalScreen",
      "screenTitle": screenTitle,
      "components": components.map((c) => c.toJson()).toList(),
    };
  }
}

class ErrorScreenModel extends ScreenModel {
  final String message;

  ErrorScreenModel(this.message);

  @override
  Map<String, dynamic> toJson() {
    return {
      "runtimeType": "errorScreen",
      "message": message,
    };
  }
}
