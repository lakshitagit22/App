import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'radio_button.dart'; // Import the RadioButton widget
final List<String> _countries = ['USA', 'Canada', 'UK', 'Australia', 'India', 'Nepal', 'Japan', 'China'];
Flushbar? _flushbar;

void showToast(BuildContext context, String message) {
  _flushbar?.dismiss();

  _flushbar = Flushbar(
    message: message,
    animationDuration: Duration(seconds: 1),
    backgroundColor: Colors.green,
    duration: null,
    borderRadius: BorderRadius.circular(8),
    isDismissible: true,
    flushbarPosition: FlushbarPosition.TOP,
    margin: EdgeInsets.fromLTRB(8, 60, 8, 0),
    mainButton: IconButton(
      icon: Icon(Icons.close, color: Colors.white),
      onPressed: () {
        _flushbar?.dismiss();
      },
    ),
  )..show(context);
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  String? _gender;
  String? _selectedCountry;
  bool _termsAccepted = false;

  final _emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  //make it global for dynamic changes
  final List<String> _countries = ['USA', 'Canada', 'UK', 'Australia', 'India', 'Nepal', 'Japan', 'China'];

  String? _genderError;

  void _clearForm() {
    _formKey.currentState?.reset();
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    setState(() {
      _gender = null;
      _selectedCountry = null;
      _termsAccepted = false;
      _genderError = null; // Clear gender error
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    // Trigger validation for the whole form
    if (_formKey.currentState?.validate() ?? false) {
      // Additional validation for gender
      if (_gender == null) {
        setState(() {
          _genderError = 'Please select a gender'; // Set gender error
        });
        return;
      } else {
        setState(() {
          _genderError = null; // Clear gender error if valid
        });
      }

      if (_selectedCountry == null) {
        showToast(context, 'Please select a country');
        return;
      }
      if (!_termsAccepted) {
        showToast(context, 'You must agree to terms and conditions');
        return;
      }

      _clearForm();
      showToast(context, 'Registration successful');
    } else {
      setState(() {
        // Trigger validation for each field
        _formKey.currentState?.validate();
      });

      // Ensure gender error message is displayed even if the form is invalid
      if (_gender == null) {
        setState(() {
          _genderError = 'Please select a gender';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:Colors.white,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4, // Adjusted height
                color: Colors.white,
              ),
              Positioned.fill(
                child: Image.asset(
                  'assets/images/register_background.png',
                  fit: BoxFit.cover, // Ensure the image covers the full width
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.of(context).size.height * 0.23, // Reduced space
                child: Column(
                  children: [
                    SizedBox(height: 30), // Reduced height
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
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Ensure the form background is white
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: Colors.black),
                          errorStyle: TextStyle(color: Colors.red), // Error text color
                        ),
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'First name is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16), // Added spacing
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(color: Colors.black),
                          errorStyle: TextStyle(color: Colors.red), // Error text color
                        ),
                        style: TextStyle(color: Colors.black),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Last name is required';
                        //   }
                        //   return null;
                        // },
                      ),
                      SizedBox(height: 16), // Added spacing
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
                          errorStyle: TextStyle(color: Colors.red), // Error text color
                        ),
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email address is required';
                          } else if (!_emailRegex.hasMatch(value)) {
                            return 'Email address is not valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16), // Added spacing
                      DropdownButtonFormField<String>(
                        value: _selectedCountry,
                        hint: Text('Select Country'),
                        decoration: InputDecoration(
                          filled: true,
                          errorStyle: TextStyle(color: Colors.red),
                          fillColor: Colors.white, // Set dropdown menu background to white
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black, // Set the color of the underline
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                        items: _countries.map((country) {
                          return DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCountry = value;
                          });
                        },
                        // validator: (value) {
                        //   if (value == null) {
                        //     return 'Please select a country';
                        //   }
                        //   return null;
                        // },
                        // // Custom dropdown menu
                        dropdownColor: Colors.white,
                        menuMaxHeight: 300, // Set a maximum height for scrolling
                      ),
                      SizedBox(height: 16), // Added spacing
                      Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: RadioButton(
                                        value: 'male',
                                        groupValue: _gender ?? '',
                                        label: 'Male',
                                        onChanged: (value) {
                                          setState(() {
                                            _gender = value;
                                            _genderError = null; // Clear error when selected
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioButton(
                                        value: 'female',
                                        groupValue: _gender ?? '',
                                        label: 'Female',
                                        onChanged: (value) {
                                          setState(() {
                                            _gender = value;
                                            _genderError = null; // Clear error when selected
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioButton(
                                        value: 'other',
                                        groupValue: _gender ?? '',
                                        label: 'Other',
                                        onChanged: (value) {
                                          setState(() {
                                            _gender = value;
                                            _genderError = null; // Clear error when selected
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                if (_genderError != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      _genderError!,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16), // Added spacing
                      FormField<bool>(
                        builder: (FormFieldState<bool> state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _termsAccepted,
                                    onChanged: (value) {
                                      setState(() {
                                        _termsAccepted = value ?? false;
                                        state.didChange(_termsAccepted);
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      'I agree to terms and conditions',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              if (state.hasError)
                                Text(
                                  state.errorText!,
                                  style: TextStyle(color: Colors.red),
                                ),
                            ],
                          );
                        },
                        validator: (value) {
                          if (!_termsAccepted) {
                            return 'You must agree to terms and conditions';
                          }
                          return null;
                        },
                        initialValue: _termsAccepted,
                      ),
                      SizedBox(height: 16), // Added spacing
                      ElevatedButton(
                        onPressed: _validateAndSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade700,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}
