import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/cubit/category_cubit/category_cubit.dart';
import 'package:k/cubit/category_cubit/category_cubit_states.dart';
import 'package:k/custom/product_card_widget.dart';
import 'package:k/data/menu_items.dart';
import 'package:k/models/productModel.dart';
import 'package:k/screens/cart_page.dart';
import 'package:k/service/get_all_products.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:popover/popover.dart';

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
        leading: Builder(
          builder: (context) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => showPopover(
              context: context,
              bodyBuilder: (context) => MenuItems(),
              width: 250,
              height: 250,
              backgroundColor: const Color(0x9AE91E62),
              direction: PopoverDirection.bottom,
            ),
            child: Icon(FontAwesomeIcons.filter),
          ),
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
      body: BlocBuilder<CategoryCubit, CategoriesStates>(
        builder: (context, state) {
          if (state is GeneralState) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10, top: 85),
              child: FutureBuilder<List<productModel>>(
                future: GetAllProducts().getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<productModel> products = snapshot.data!;
                    return GridView.builder(
                        itemCount: products.length - 1,
                        clipBehavior: Clip.none,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                            mainAxisSpacing: 85,
                            crossAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          return productCardWidget(
                            productInfo: products[index],
                          );
                        });
                  } else if (snapshot.hasError) {
                    log(snapshot.error.toString());
                    return Text(
                      'erorr ${snapshot.error.toString()}',
                      style: TextStyle(fontSize: 55),
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
          } else if (state is CategoryState) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10, top: 85),
              child: GridView.builder(
                  itemCount: state.list.length - 1,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 85,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return productCardWidget(
                      productInfo: state.list[index],
                    );
                  }),
            );
          } else {
            return Text(
              'Error in home Page',
              style: TextStyle(fontSize: 50),
            );
          }
        },
      ),
    );
  }
}
