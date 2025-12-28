import 'package:flutter/material.dart';
import '../api/api_service.dart';
import 'screen_mapper.dart';

class SDUIScreen extends StatefulWidget {
  final String screenName;

  const SDUIScreen({super.key, required this.screenName});

  @override
  State<SDUIScreen> createState() => _SDUIScreenState();
}

class _SDUIScreenState extends State<SDUIScreen> {
  late Future<Map<String, dynamic>> screenFuture;

  @override
  void initState() {
    super.initState();
    screenFuture = ApiService.fetchScreen(widget.screenName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: screenFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading screen"));
          }

          return ScreenMapper.buildScreen(
            context,
            snapshot.data as Map<String, dynamic>,
          );
        },
      ),
    );
  }
}
