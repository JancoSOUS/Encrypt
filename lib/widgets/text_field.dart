import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.autofocus = false,
  }) : super(key: key);

  final bool autofocus;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
        autofocus: widget.autofocus,
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          labelText: widget.labelText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
