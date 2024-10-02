import 'package:flutter/material.dart';

class DisplayMessage {

  static void errorMessage(String message,BuildContext context) {
    var snackbar = SnackBar(content: Text(message),behavior: SnackBarBehavior.floating,);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}