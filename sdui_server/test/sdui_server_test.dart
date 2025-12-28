import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:sdui_models/sdui_models.dart';

Handler buildServer() {
  final router = Router();

  router.post('/screens/<name>', (Request request, String name) {
    print("Requested screen: $name");

    ScreenModel screen;

    switch (name) {
      case 'home':
        screen = VerticalScreenModel(
          screenTitle: "Home",
          components: [
            TitleComponent("Welcome to SDUI App"),
            SpacerComponent(16),
            ButtonComponent(
              label: "Go to Profile",
              action: NavigateAction("profile"),
            ),
          ],
        );
        break;

      default:
        screen = ErrorScreenModel("Screen not found");
    }

    return Response.ok(
      jsonEncode(screen.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  });
  
  return router.call;
}
