import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      duration: Duration(milliseconds: 170),
    );
    _postionAnim = Tween<Offset>(
      begin: Offset(-30, 0),
      end: Offset(30, 0),
    ).animate(_controller);
    _angleAnim = Tween<double>(begin: 2, end: 6).animate(_controller);
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
