import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:k/custom/custom_text_fromField.dart';
import 'package:k/service/add_product.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String? title, price, desc, image, category;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 80),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              customTextFormField(
                title: 'Product Name',
                onChanged: (value) {
                  title = value;
                },
              ),
              SizedBox(height: 20),
              customTextFormField(
                title: 'Price',
                onChanged: (value) {
                  price = value;
                },
              ),
              SizedBox(height: 20),
              customTextFormField(
                title: 'Description',
                onChanged: (value) {
                  desc = value;
                },
              ),
              SizedBox(height: 20),
              customTextFormField(
                title: 'Image',
                onChanged: (value) {
                  image = value;
                },
              ),
              SizedBox(height: 20),
              customTextFormField(
                title: 'Category',
                onChanged: (value) {
                  category = value;
                },
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await AddProduct().addProduct(
                          title: title!,
                          price: price!,
                          desc: desc!,
                          image: image!,
                          category: category!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('The product added successfuly '),
                        ),
                      );
                    } catch (e) {
                      throw Exception(e.toString());
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.pinkAccent,
                  ),
                  child: Center(
                      child: Text(
                    'Post Product',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontFamily: 'Oswald',
                      shadows: [
                        Shadow(
                          blurRadius: 80,
                        )
                      ],
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
