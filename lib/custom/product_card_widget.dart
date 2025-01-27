import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/models/productModel.dart';
import 'package:k/screens/update_product_page.dart';

class productCardWidget extends StatefulWidget {
  productCardWidget({required this.productInfo});
  productModel productInfo;

  @override
  State<productCardWidget> createState() => _productCardWidgetState();
}

class _productCardWidgetState extends State<productCardWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _PosController;
  late Animation<Color?> _animatedColor;
  late Animation<double> _animationPostion;
  bool isRed = false;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _PosController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));

    _animatedColor = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(_controller);
    _animationPostion = Tween<double>(begin: 85, end: 105).animate(
        CurvedAnimation(parent: _PosController, curve: Curves.easeInOut));

    _PosController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _PosController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id,
            arguments: widget.productInfo);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: 130,
            // width: 220,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productInfo.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' + '${widget.productInfo.price}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isRed) {
                                _controller.reverse();
                                isRed = false;
                              } else {
                                _PosController.forward();
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
                                size: 25,
                                color: _animatedColor.value,
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animationPostion,
            builder: (context, child) {
              return Positioned(
                left: 67,
                bottom: _animationPostion.value,
                child: child!,
              );
            },
            child: Image.network(
              widget.productInfo.image,
              height: 100,
              width: 120,
            ),
          ),
        ],
      ),
    );
  }
}
