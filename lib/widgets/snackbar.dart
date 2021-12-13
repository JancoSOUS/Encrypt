import 'package:flutter/material.dart';

void showSnackBar(
    GlobalKey<ScaffoldMessengerState> messangerKey, String message) {
  final snackBar = SnackBar(
    duration: const Duration(milliseconds: 2500),
    elevation: 10,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
    ),
    backgroundColor: Colors.purple,
    content: Text(message),
  );
  messangerKey.currentState!.showSnackBar(snackBar);
}
