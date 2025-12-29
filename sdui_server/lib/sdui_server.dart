import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:sdui_models/sdui_models.dart';
import 'package:sdui_models/components/advanced_components.dart';

Future<void> startServer() async {
  final router = Router();

  router.post('/screens/<name>', (Request request, String name) {
    ScreenModel screen;

    switch (name) {
      case 'home':
        screen = VerticalScreenModel(
          screenTitle: "Home",
          components: [
            TitleComponent("Welcome to SDUI App"),
            ImageBannerComponent("https://picsum.photos/600/300"),
            SpacerComponent(16),
            HorizontalListComponent([
              CardComponent(title: "Card 1", subtitle: "Desc 1"),
              CardComponent(title: "Card 2", subtitle: "Desc 2"),
              CardComponent(title: "Card 3", subtitle: "Desc 3"),
              CardComponent(title: "Card 4", subtitle: "Desc 4"),
            ]),
            SpacerComponent(16),
            ButtonComponent(
              label: "Go to Profile",
              action: NavigateAction("profile"),
            ),
            ButtonComponent(
              label: "Go to Settings",
              action: NavigateAction("settings"),
            ),
          ],
        );
        break;

      case 'profile':
        screen = VerticalScreenModel(
          screenTitle: "Profile",
          components: [
            TitleComponent("Your Profile"),
            InfoTileComponent(
              title: "Ambrish Tripathi",
              subtitle: "ambrish@email.com",
            ),
            CardComponent(
              title: "Stats",
              subtitle: "Posts: 10 | Likes: 120",
            ),
            ButtonComponent(
              label: "Show Snackbar",
              action: SnackbarAction("Profile Loaded"),
            ),
            ButtonComponent(
              label: "Log Event",
              action: LogEventAction("profile_screen_opened"),
            ),
            ButtonComponent(
              label: "Go Back",
              action: BackAction(),
            ),
          ],
        );
        break;

      case 'settings':
        screen = VerticalScreenModel(
          screenTitle: "Settings",
          components: [
            InfoTileComponent(title: "Notifications", subtitle: "Enabled"),
            DividerComponent(),
            InfoTileComponent(title: "Privacy", subtitle: "Standard"),
            DividerComponent(),
            InfoTileComponent(title: "About", subtitle: "SDUI Demo App"),
            SpacerComponent(16),
            ButtonComponent(
              label: "Open Website",
              action: OpenUrlAction("https://flutter.dev"),
            ),
            ButtonComponent(
              label: "Go Back",
              action: BackAction(),
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

  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(router.call);

  // Emulator & device friendly
  await serve(handler, '0.0.0.0', 8080);
  print('Server running at http://localhost:8080');
}
