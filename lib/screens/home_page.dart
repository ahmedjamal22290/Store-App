import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/custom/custom_menu_botun.dart';
import 'package:k/screens/cart_page.dart';
import 'package:k/screens/home_section.dart';
import 'package:k/screens/post_page.dart';
import 'package:k/screens/search_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> sections = [
    home(),
    SearchSection(),
    PostPage(),
    CartPage(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (value) {
          _selectedIndex = value;
          setState(() {});
        },
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(FontAwesomeIcons.house),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(FontAwesomeIcons.magnifyingGlass),
          ),
          BottomNavigationBarItem(
            label: 'Post',
            icon: Icon(FontAwesomeIcons.circlePlus),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(_selectedIndex == 3
                ? FontAwesomeIcons.solidHeart
                : FontAwesomeIcons.heart),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Builder(
          builder: (context) => customMenuBotun(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartPage.id);
            },
            icon: Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          "New Trend",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: sections[_selectedIndex],
    );
  }
}
