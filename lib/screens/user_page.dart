import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/custom/custom_mode_buton.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0x1F797979),
              ),
              child: Icon(
                FontAwesomeIcons.userLarge,
                size: 150,
              ),
            ),
          ),
          Divider(
            height: 4,
            thickness: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4.0),
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(
                    15,
                  )),
              child: Row(
                children: [
                  Text(
                    'Mode',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.deepPurpleAccent,
                    ),
                    child: customModeButon(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
