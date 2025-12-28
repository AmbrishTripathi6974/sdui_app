import 'component_model.dart';

class ImageBannerComponent extends ComponentModel {
  final String imageUrl;

  ImageBannerComponent(this.imageUrl);

  @override
  Map<String, dynamic> toJson() => {
        "runtimeType": "imageBanner",
        "imageUrl": imageUrl,
      };
}

class CardComponent extends ComponentModel {
  final String title;
  final String subtitle;

  CardComponent({required this.title, required this.subtitle});

  @override
  Map<String, dynamic> toJson() => {
        "runtimeType": "card",
        "title": title,
        "subtitle": subtitle,
      };
}

class HorizontalListComponent extends ComponentModel {
  final List<CardComponent> items;

  HorizontalListComponent(this.items);

  @override
  Map<String, dynamic> toJson() => {
        "runtimeType": "horizontalList",
        "items": items.map((e) => e.toJson()).toList(),
      };
}

class InfoTileComponent extends ComponentModel {
  final String title;
  final String subtitle;
  final String? icon;

  InfoTileComponent({
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  Map<String, dynamic> toJson() => {
        "runtimeType": "infoTile",
        "title": title,
        "subtitle": subtitle,
        "icon": icon,
      };
}

class DividerComponent extends ComponentModel {
  @override
  Map<String, dynamic> toJson() => {
        "runtimeType": "divider",
      };
}
