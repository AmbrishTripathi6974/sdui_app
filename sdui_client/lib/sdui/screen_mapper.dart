import 'package:flutter/material.dart';
import 'component_mapper.dart';

class ScreenMapper {
  static Widget buildScreen(
    BuildContext context,
    Map<String, dynamic> json,
  ) {
    if (json["runtimeType"] == "verticalScreen") {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(title: Text(json["screenTitle"])),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: (json["components"] as List)
                    .map((c) =>
                        ComponentMapper.build(context, c))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    return const Center(child: Text("Unknown Screen"));
  }
}
