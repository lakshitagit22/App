import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart'; // Import Flushbar
//imports flusbar class from the another_flushbar package which is used for displaying toast-like messages
// Utility function to show flushbar
void showToast(BuildContext context, String message) {
  Flushbar( //widget that displays a temporary message or notification
    message: message, //text content that will be displayed in flushbar
    animationDuration: const Duration(seconds: 1),//after how long the message will appear
    backgroundColor: Colors.green,
    duration: null, //how long the flushbar remains visible // Long duration to make it persistent
    borderRadius: BorderRadius.circular(8),
    isDismissible: true, // Allows the user to dismiss the message
    mainButton: TextButton(
      onPressed: () {
        Flushbar.of(context)?.dismiss(); // Dismiss the Flushbar when button is pressed
      },
      child: Text(
        'CLOSE',
        style: TextStyle(color: Colors.white),
      ),
    ),
  )..show(context);
}
