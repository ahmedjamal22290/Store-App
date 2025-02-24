import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/custom/custom_search_bar.dart';
import 'package:k/custom/product_card_widget.dart';
import 'package:k/models/productModel.dart';
import 'package:k/service/get_all_products.dart';

class SearchSection extends StatefulWidget {
  SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  TextEditingController _controller = TextEditingController();
  List<productModel> products = [];
  bool isMoreThan2 = false;
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customSearchBar(
            controller: _controller,
            onChanged: (value) {
              _controller.text = value;
              log(value);
              setState(() {});
            },
          ),
          findProduct(_controller.text) == null
              ? Container(
                  height: 5,
                )
              : Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 350,
                  width: 300,
                  child: ListView(
                    children: findProduct(_controller.text)!,
                  ),
                ),
          SizedBox(height: 15),
          isMoreThan2 && _controller.text != ""
              ? Icon(
                  FontAwesomeIcons.circleArrowDown,
                  color: Colors.pinkAccent,
                )
              : Container(),
        ],
      ),
    );
  }

  Future<void> fetchProducts() async {
    products = await GetAllProducts().getProducts();
    if (mounted) {
      setState(() {});
    }
  }

  List<Widget>? findProduct(String product) {
    if (product == "") return null;
    List<Widget>? productList = [];
    for (int i = 0; i < products.length; i++) {
      if (products[i].title.toLowerCase().contains(product.toLowerCase())) {
        productList.add(Container(
            margin: EdgeInsets.only(top: 50),
            height: 150,
            width: 300,
            child: productCardWidget(productInfo: products[i])));
      }
    }
    if (productList.length > 2) {
      isMoreThan2 = true;
    } else {
      isMoreThan2 = false;
    }
    if (mounted) {
      setState(() {});
    }
    return productList.length == 0 ? null : productList;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
