import 'package:flutter/material.dart';
import 'package:k/custom/custom_textField.dart';

class UpdateProductPage extends StatelessWidget {
  const UpdateProductPage({super.key});
  static String id = "updateProductPage";
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField(
              labelText: 'Product Name',
            ),
            SizedBox(height: 18),
            customTextField(
              labelText: 'Descriptioon',
            ),
            SizedBox(height: 18),
            customTextField(
              labelText: 'Price',
            ),
            SizedBox(height: 18),
            customTextField(
              labelText: 'Image',
            ),
            SizedBox(height: 18),
            customTextField(
              labelText: 'Product Name',
            ),
            SizedBox(height: 80),
            GestureDetector(
              onTap: () {},
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
    );
  }
}
