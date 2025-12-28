import 'package:flutter/material.dart';
import 'action_handler.dart';

class ComponentMapper {
  static Widget build(BuildContext context, Map<String, dynamic> json) {
    switch (json["runtimeType"]) {
      case "title":
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            json["title"],
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        );

      case "spacer":
        return SizedBox(height: (json["height"] as num).toDouble());

      case "imageBanner":
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: Image.network(
                json["imageUrl"],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    // Image fully loaded
                    return child;
                  }

                  // While loading
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
        );

      case "button":
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => ActionHandler.handle(context, json["action"]),
              child: Text(json["label"]),
            ),
          ),
        );

      case "card":
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.08),
                  Theme.of(context).colorScheme.primary.withOpacity(0.02),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    json["title"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    json["subtitle"],
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ),
        );

      case "horizontalList":
        return SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: json["items"].length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = json["items"][index];
              return SizedBox(
                width: 200,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["title"],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item["subtitle"],
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );

      case "infoTile":
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: const Icon(Icons.verified_user),
            title: Text(json["title"]),
            subtitle: Text(json["subtitle"]),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );

      case "divider":
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(thickness: 1),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
