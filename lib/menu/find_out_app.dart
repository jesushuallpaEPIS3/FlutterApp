import 'package:flutter/material.dart';
import 'package:flutter_application_2/menu/screens/welcome_screen.dart';

import 'package:google_fonts/google_fonts.dart';

class FindOutApp extends StatelessWidget {
  const FindOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFFF256C),
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.white,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}
