import 'package:flutter/material.dart';
import 'package:flutter_application_2/travel_app/theme/theme.dart';
import 'package:flutter_application_2/travel_app/ui/feed/feed_screen.dart';

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TravelTheme.theme,
      home: const FeedScreen(),
    );
  }
}
