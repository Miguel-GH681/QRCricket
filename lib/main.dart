import 'package:flutter/material.dart';
import 'package:qr_cricket/pages/home_page.dart';
import 'package:qr_cricket/pages/map_page.dart';
import 'package:qr_cricket/theme/custom_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home' : (_) => HomePage(),
        'map' : (_) => MapPage()
      },
      theme: CustomTheme.lightTheme      
    );
  }
}