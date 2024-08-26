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
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold), // Adjust font size as needed
            ),
          ],
        ),
        toolbarHeight: kToolbarHeight, // Optionally set the height of the AppBar
        elevation: 0, // Optionally set elevation if you want a flat AppBar
        backgroundColor: Colors.white, // Set the background color to white
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Height of the bottom border line
          child: Container(
            color: Colors.grey[300], // Color of the bottom border line
            height: 1.0, // Thickness of the bottom border line
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // Set the background color of the body to white
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset('assets/images/welcome_background.png'), // Image asset
              Image(
                image:AssetImage('assets/images/welcome_background.png'),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'We\'re excited to have you here!\n',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
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
                      text: 'building mobile application using Flutter.!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                textAlign: TextAlign.center, // Optional: center the entire text block
              )
            ],
          ),
        ),
      ),
    );
  }
}
