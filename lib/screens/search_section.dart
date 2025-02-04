import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/custom/product_card_widget.dart';
import 'package:k/models/productModel.dart';
import 'package:k/service/get_all_products.dart';

class SearchSection extends StatefulWidget {
  SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  String Text = "";
  late List<productModel> products;
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
          customSearchBar(text: Text),
          findProduct(Text) == null
              ? Container(
                  height: 5,
                )
              : productCardWidget(productInfo: findProduct(Text)!),
        ],
      ),
    );
  }

  Future<void> fetchProducts() async {
    products = await GetAllProducts().getProducts();
    setState(() {}); // To refresh the UI after fetching products
  }

  productModel? findProduct(String product) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].title == product) {
        return products[i];
      }
    }
    return null;
  }
}

class customSearchBar extends StatefulWidget {
  customSearchBar({super.key, required this.text});
  String text;

  @override
  State<customSearchBar> createState() => _customSearchBarState();
}

class _customSearchBarState extends State<customSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: TextFormField(
          validator: (value) {
            if (value == null || value == "") {
              return "The search section is Empty";
            }
          },
          onChanged: (value) {
            widget.text = value;
            setState(() {});
            log(widget.text);
          },
          decoration: InputDecoration(
            suffixIcon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 21,
            ),
            suffixIconColor: Colors.pink,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.pink,
              ),
              borderRadius: BorderRadius.circular(
                25,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.2,
              ),
              borderRadius: BorderRadius.circular(
                9,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
