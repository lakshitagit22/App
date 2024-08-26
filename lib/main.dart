import 'package:flutter/material.dart';

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
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Aligns the title to the left
          children: [
            Text(
              'Greetings, Developer!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Adjust font size as needed
            ),
          ],
        ),
        toolbarHeight: kToolbarHeight, // Optionally set the height of the AppBar
        elevation: 0, // Optionally set elevation if you want a flat AppBar
        backgroundColor: Colors.white, // Set the background color to white
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Height of the bottom border line
          child: Container(
            height: 1.0, // Thickness of the bottom border line
            decoration: BoxDecoration(
              color: Colors.grey[300], // Color of the bottom border line
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // Shadow position
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // Set the background color of the body to white
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Reduced padding to lift the image and text closer together
              Padding(
                padding: const EdgeInsets.only(top: 2.0), // Reduced from 20.0
                child: Image(
                  image: AssetImage('assets/images/welcome_background.png'),
                ),
              ),
              SizedBox(height: 1), // Reduced space between image and text
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'We\'re excited to have you here!\n',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n', // Use a newline or space character
                      style: TextStyle(fontSize: 0), // Zero size to make it invisible
                    ),
                    TextSpan(
                      text: 'This app is crafted to teach you the\n ',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    TextSpan(
                      text: 'fundamentals and get you comfortable with\n ',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    TextSpan(
                      text: 'building mobile application using Flutter!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                textAlign: TextAlign.center, // Optional: center the entire text block
              ),
              SizedBox(height: 100), // Adjust this value as needed for spacing below the text
            ],
          ),
        ),
      ),
    );
  }
}
