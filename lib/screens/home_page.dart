import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/custom/product_card_widget.dart';
import 'package:k/models/productModel.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10, top: 85),
        child: GridView.builder(
            clipBehavior: Clip.none,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                mainAxisSpacing: 85,
                crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return productCardWidget(
                productInfo: productModel(
                    category: "category",
                    description: 'description',
                    id: 7,
                    image:
                        'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
                    price: 223,
                    title: 'Mens Casual Premium Slim Fit T-Shirts ',
                    rating: ratingModel(count: 4, rate: 5)),
              );
            }),
      ),
    );
  }
}
