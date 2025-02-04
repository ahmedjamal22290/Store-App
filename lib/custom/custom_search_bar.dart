import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class customSearchBar extends StatelessWidget {
  final TextEditingController controller;

  customSearchBar({required this.controller, required this.onChanged});
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass, size: 21),
            suffixIconColor: Colors.pink,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.pink),
              borderRadius: BorderRadius.circular(25),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2.2),
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
      ),
    );
  }
}
