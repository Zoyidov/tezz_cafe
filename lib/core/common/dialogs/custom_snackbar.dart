import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showErrorMessage(BuildContext context, String errorMessage) {
    _showSnackBar(context, errorMessage, Colors.red);
  }

  static void showSuccessMessage(BuildContext context, String successMessage) {
    _showSnackBar(context, successMessage, Colors.green);
  }

  static void _showSnackBar(BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        showCloseIcon: true,
      ),
    );
  }
}
