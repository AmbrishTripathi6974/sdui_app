abstract class ActionModel {
  Map<String, dynamic> toJson();
}

class NavigateAction extends ActionModel {
  final String screen;

  NavigateAction(this.screen);

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": "navigate",
      "screen": screen,
    };
  }
}

class BackAction extends ActionModel {
  @override
  Map<String, dynamic> toJson() {
    return {
      "type": "back",
    };
  }
}

class SnackbarAction extends ActionModel {
  final String message;

  SnackbarAction(this.message);

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": "snackbar",
      "message": message,
    };
  }
}

class OpenUrlAction extends ActionModel {
  final String url;

  OpenUrlAction(this.url);

  @override
  Map<String, dynamic> toJson() => {
        "type": "open_url",
        "url": url,
      };
}

class LogEventAction extends ActionModel {
  final String event;

  LogEventAction(this.event);

  @override
  Map<String, dynamic> toJson() => {
        "type": "log_event",
        "event": event,
      };
}