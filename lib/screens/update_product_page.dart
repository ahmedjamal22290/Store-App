import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:k/custom/custom_textField.dart';
import 'package:k/models/productModel.dart';
import 'package:k/service/update_product_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = "updateProductPage";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;

  double? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    productModel product =
        ModalRoute.of(context)!.settings.arguments as productModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Update Product',
          style: TextStyle(
            color: Color(0xff344E41),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: ModalProgressHUD(
          opacity: 0.1,
          color: Colors.white38,
          blur: 0.5,
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 115),
                customTextField(
                  onChange: (data) {
                    productName = data;
                  },
                  labelText: 'Product Name',
                ),
                SizedBox(height: 18),
                customTextField(
                  onChange: (data) {
                    description = data;
                  },
                  labelText: 'Description',
                ),
                SizedBox(height: 18),
                customTextField(
                  keyboardType: TextInputType.number,
                  onChange: (data) {
                    price = double.parse(data);
                  },
                  labelText: 'Price',
                ),
                SizedBox(height: 18),
                customTextField(
                  onChange: (data) {
                    image = data;
                  },
                  labelText: 'Image',
                ),
                SizedBox(height: 80),
                GestureDetector(
                  onTap: () {
                    isLoading = true;
                    setState(() {});
                    try {
                      updateMethod(product);
                      log("Success");
                    } catch (e) {
                      log(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff344E41),
                    ),
                    child: Center(
                        child: Text(
                      'Update',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateMethod(productModel product) {
    UpdateProductService().updateProductService(
        id: UpdateProductPage.id,
        title: productName ?? product.title,
        price: price.toString(),
        desc: description ?? product.description,
        image: image ?? product.image,
        category: product.category);
  }
}
