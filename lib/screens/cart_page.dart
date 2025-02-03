import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/isfav_cubit/isfav_cubit.dart';
import 'package:k/custom/product_card_widget.dart';
import 'package:k/models/productModel.dart';
import 'package:k/service/get_all_products.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String id = "cartPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: GetAllProducts().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<productModel>? products = context.read<IsFavCubit>().getFav();

            return Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: GridView.builder(
                  clipBehavior: Clip.none,
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 85,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return productCardWidget(productInfo: products[index]);
                  }),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 300.0),
              child: Center(
                child: LoadingAnimationWidget.threeRotatingDots(
                    color: Colors.red, size: 115),
              ),
            );
          }
        },
      ),
    );
  }
}
