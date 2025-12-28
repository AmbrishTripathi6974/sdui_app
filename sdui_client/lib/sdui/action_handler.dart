import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sdui_screen.dart';

class ActionHandler {
  static Future<void> handle(
    BuildContext context,
    Map<String, dynamic> action,
  ) async {
    switch (action["type"]) {
      case "navigate":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SDUIScreen(screenName: action["screen"]),
          ),
        );
        break;

      case "back":
        Navigator.pop(context);
        break;

      case "snackbar":
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(action["message"])),
        );
        break;

      case "open_url":
        final Uri uri = Uri.parse(action["url"]);

        if (await canLaunchUrl(uri)) {
          await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Cannot open website")),
          );
        }
        break;

      case "log_event":
        debugPrint("LOG EVENT: ${action["event"]}");
        break;

      default:
        debugPrint("Unknown action: ${action["type"]}");
    }
  }
}
