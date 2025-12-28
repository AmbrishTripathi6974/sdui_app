import 'package:sdui_models/sdui_models.dart';

void main() {
  final screen = VerticalScreenModel(
    screenTitle: 'Home',
    components: [
      TitleComponent('Welcome to SDUI'),
      SpacerComponent(16),
      ButtonComponent(
        label: 'Go to Profile',
        action: NavigateAction('profile'),
      ),
    ],
  );

  print(screen.toJson());
}
