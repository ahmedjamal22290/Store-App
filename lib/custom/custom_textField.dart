import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  customTextField(
      {super.key, required this.labelText, this.onChange, this.keyboardType});
  final String labelText;
  Function(String)? onChange;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Color(0xff344E41),
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xff588157),
            width: 1,
          ),
        ),
      ),
    );
  }
}
