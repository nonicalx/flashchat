import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final Function onChange;
  final bool obscure;
  const TextInput({this.hint, this.obscure = false, this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: obscure ? TextInputType.text : TextInputType.emailAddress,
      textAlign: TextAlign.center,
      obscureText: obscure,
      style: TextStyle(color: Colors.black),
      onChanged:
          //Do something with the user input.
          onChange,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
