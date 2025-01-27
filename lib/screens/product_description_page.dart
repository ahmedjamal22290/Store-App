import 'package:flutter/material.dart';

class descPage extends StatelessWidget {
  const descPage({super.key});
  static String id = "descPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
