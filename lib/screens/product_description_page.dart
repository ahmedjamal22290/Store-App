import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/cubit/isfav_cubit/isFav_states.dart';
import 'package:k/cubit/isfav_cubit/isfav_cubit.dart';
import 'package:k/custom/product_card_widget.dart';
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
    return BlocBuilder<IsFavCubit, IsFavState>(
      builder: (context, state) {
        final isFav =
            context.read<IsFavCubit>().isFavorite(product.id.toString());
        if (isFav) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actionsIconTheme: IconThemeData(color: Colors.black54),
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Column(
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
                      width: 310,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        product.title,
                        style: TextStyle(
                          fontFamily: 'Oswald',
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
                            final isFav = context
                                .read<IsFavCubit>()
                                .isFavorite(product.id.toString());
                            context
                                .read<IsFavCubit>()
                                .toggleFavorite(product, !isFav);
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
                            fontFamily: 'Oswald',
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
                    fontFamily: 'Inconsolata',
                    color: const Color(0xFF4D4D4D),
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
