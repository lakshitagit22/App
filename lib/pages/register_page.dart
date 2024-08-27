import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    _firstNameController.clear();
    _lastNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/register_background.png',
              // fit: BoxFit.cover, // Ensure the image covers the whole screen
              alignment: Alignment.topCenter, // Aligns the image to the top
            ),
          ),
          // Heading
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.10, // Position the heading higher
            child: Column(
              children: [
                SizedBox(height: 130), // <-- Adjust this value to shift the heading up or down
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Create your new Account',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // White background container for form area
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: MediaQuery.of(context).size.height * 0.35, // Adjusted to ensure form is visible above the image
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.black),
                        // border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.black),
                        // border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 120),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _clearForm();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Form submitted')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade300, // Background color
                        minimumSize: Size(290, 50), // Increase the size of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Curve the edges
                        ),
                        textStyle: TextStyle(
                          fontSize: 18, // Increase the text size if needed
                        ),
                      ),
                      child: Text(
                          'Register',
                        style: TextStyle(
                          fontSize: 18, // Increase the text size if needed
                          // fontWeight: FontWeight.bold, // Make the text bold
                          color: Colors.black, // Set the text color to black
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
