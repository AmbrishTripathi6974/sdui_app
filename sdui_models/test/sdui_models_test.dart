import 'package:test/test.dart';
import 'package:sdui_models/sdui_models.dart';

void main() {
  group('SDUI Models Tests', () {
    test('VerticalScreenModel generates valid JSON', () {
      final screen = VerticalScreenModel(
        screenTitle: 'Home',
        components: [
          TitleComponent('Welcome'),
          SpacerComponent(8),
        ],
      );

      final json = screen.toJson();

      expect(json['runtimeType'], 'verticalScreen');
      expect(json['screenTitle'], 'Home');
      expect(json['components'], isA<List>());
      expect(json['components'].length, 2);
    });

    test('ButtonComponent contains NavigateAction', () {
      final button = ButtonComponent(
        label: 'Profile',
        action: NavigateAction('profile'),
      );

      final json = button.toJson();

      expect(json['runtimeType'], 'button');
      expect(json['label'], 'Profile');
      expect(json['action']['type'], 'navigate');
      expect(json['action']['screen'], 'profile');
    });
  });
}
