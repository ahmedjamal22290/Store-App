import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/isfav_cubit/isfav_cubit.dart';
import 'package:k/screens/home_page.dart';
import 'package:k/screens/product_description_page.dart';
import 'package:k/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
        descPage.id: (context) => descPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
