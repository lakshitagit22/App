import 'package:flutter/material.dart';
import 'pages/welcome_page.dart'; // Import WelcomePage from its file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(), // Use WelcomePage from pages directory
    );
  }
}
