import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/models/productModel.dart';

class descPage extends StatefulWidget {
  const descPage({super.key});
  static String id = "descPage";

  @override
  State<descPage> createState() => _descPageState();
}

class _descPageState extends State<descPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animatedColor;
  bool isRed = false;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animatedColor =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productModel product =
        ModalRoute.of(context)!.settings.arguments as productModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.image,
                scale: 5,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Container(
                  width: 320,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    product.title,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isRed) {
                            _controller.reverse();
                            isRed = false;
                          } else {
                            _controller.forward();
                            isRed = true;
                          }
                        });
                      },
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Icon(
                            FontAwesomeIcons.solidHeart,
                            size: 30,
                            color: _animatedColor.value,
                          );
                        },
                      ),
                    ),
                    Text(
                      r'$' '${product.price}',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              product.description,
              style: TextStyle(
                color: const Color(0xFF4D4D4D),
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
