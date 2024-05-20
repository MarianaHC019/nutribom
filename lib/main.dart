import 'package:flutter_application_1/pages/login.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter.io',
      theme: ThemeData(
          primarySwatch: Colors.green,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade900,
            foregroundColor: Colors.white,
          )),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            backgroundColor: Colors.green.shade100,
            foregroundColor: Colors.green.shade900,
          ))),
      home: LoginPage(),
    );
  }
}
