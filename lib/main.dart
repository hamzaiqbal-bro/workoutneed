import 'package:flutter/material.dart';
import 'package:workour/constants/app_theme.dart';
import 'package:workour/ui/splashScreen/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Work Out',
      theme: themeData,
      home: splashScreen(),
    );
  }
}


