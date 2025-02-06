import 'dart:ui';

import 'package:flutter/material.dart';

class customTextFormField extends StatelessWidget {
  const customTextFormField({
    super.key,
    required this.title,
    required this.onChanged,
  });
  final String title;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value == "") {
          return "Field is Empty";
        }
      },
      decoration: InputDecoration(
        label: Text(title),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.pink,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xff588157),
            width: 1,
          ),
        ),
      ),
    );
  }
}
