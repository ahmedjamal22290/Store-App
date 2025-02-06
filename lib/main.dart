import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/category_cubit/category_cubit.dart';
import 'package:k/cubit/isfav_cubit/isfav_cubit.dart';
import 'package:k/cubit/mode_cubit/mode_cubit.dart';
import 'package:k/cubit/mode_cubit/mode_states.dart';
import 'package:k/screens/cart_page.dart';
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
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: BlocProvider(
        create: (context) => ModeCubit(),
        child: BlocProvider(
          create: (context) => IsFavCubit(),
          child: BlocBuilder<ModeCubit, ModeCubitStates>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  brightness: state is lightModeState
                      ? Brightness.light
                      : Brightness.dark,
                ),
                debugShowCheckedModeBanner: false,
                routes: {
                  HomePage.id: (context) => const HomePage(),
                  UpdateProductPage.id: (context) => UpdateProductPage(),
                  descPage.id: (context) => descPage(),
                  CartPage.id: (context) => CartPage(),
                },
                initialRoute: HomePage.id,
              );
            },
          ),
        ),
      ),
    );
  }
}
