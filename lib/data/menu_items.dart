import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/cubit/category_cubit/category_cubit.dart';
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
          categories?.add('Back');
          return ListView.builder(
            itemCount: categories!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (categories[index] == 'Back') {
                    BlocProvider.of<CategoryCubit>(context).returnToGeneral();
                  } else {
                    BlocProvider.of<CategoryCubit>(context)
                        .getCategory(categories[index]);
                  }
                },
                child: Container(
                  height: 50,
                  color: categories[index] == 'Back'
                      ? const Color.fromARGB(255, 207, 46, 164)
                      : Colors.pink,
                  child: categories[index] == 'Back'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.circleXmark),
                            SizedBox(width: 15),
                            Text(
                              categories[index],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Oswald',
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Oswald',
                            ),
                          ),
                        ),
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
