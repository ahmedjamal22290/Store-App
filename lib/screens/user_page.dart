import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  color: Colors.pink,
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
                  customModeButon()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class customModeButon extends StatefulWidget {
  const customModeButon({
    super.key,
  });

  @override
  State<customModeButon> createState() => _customModeButonState();
}

class _customModeButonState extends State<customModeButon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _postionAnim;
  late Animation<double> _angleAnim;
  bool isDark = false;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    _postionAnim = Tween<Offset>(
      begin: Offset(-35, 0),
      end: Offset(0, 0),
    ).animate(_controller);
    _angleAnim = Tween<double>(begin: 3, end: 6).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _angleAnim.value,
          origin: _postionAnim.value,
          child: Transform.translate(
            offset: _postionAnim.value,
            child: GestureDetector(
              onTap: () {
                if (isDark) {
                  _controller.reverse();

                  isDark = false;
                } else {
                  _controller.forward();
                  isDark = true;
                }
              },
              child: Container(
                child: Icon(
                  isDark
                      ? FontAwesomeIcons.solidMoon
                      : FontAwesomeIcons.solidSun,
                  size: 30,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
