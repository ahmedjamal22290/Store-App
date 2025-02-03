import 'package:flutter/material.dart';
import 'package:k/service/all_category.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllCategoriesService().getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic>? categories = snapshot.data;
          return ListView.builder(
            itemCount: categories!.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: Colors.purple,
                child: Text(
                  categories[index],
                ),
              );
            },
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
    );
  }
}
