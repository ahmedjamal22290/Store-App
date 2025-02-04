import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchSection extends StatefulWidget {
  SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  String Text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextFormField(
            validator: (value) {
              if (value == null || value == "") {
                log('message');
                return "The search section is Empty";
              }
            },
            onChanged: (value) {
              Text = value;
              setState(() {});
              log(Text);
            },
            decoration: InputDecoration(
              suffixIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 21,
              ),
              suffixIconColor: Colors.pink,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.pink,
                ),
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.2,
                ),
                borderRadius: BorderRadius.circular(
                  9,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
