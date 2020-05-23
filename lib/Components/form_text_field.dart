import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {

  final hintText;
  final controller;


  FormTextField({@required this.hintText, this.controller, InputDecoration decoration});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide(),
        ),
      ),

      controller: controller,

    );
  }
}
