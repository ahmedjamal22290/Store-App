import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          )
        ],
        title: Text(
          "New Trend",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 130,
              width: 220,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 40,
                    spreadRadius: 0,
                    offset: Offset(10, 10))
              ]),
              child: Card(
                elevation: 12,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Red Shirt",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$227',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 125,
              bottom: 85,
              child: Image.asset(
                'assets/testShirt.png',
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
