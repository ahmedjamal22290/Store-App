import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              customTextFormField(
                title: 'Price',
                onChanged: (value) {
                  price = value;
                },
              ),
              customTextFormField(
                title: 'Description',
                onChanged: (value) {
                  desc = value;
                },
              ),
              customTextFormField(
                title: 'Image',
                onChanged: (value) {
                  image = value;
                },
              ),
              customTextFormField(
                title: 'Category',
                onChanged: (value) {
                  category = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class customTextFormField extends StatelessWidget {
  const customTextFormField({
    super.key,
    required this.title,
    required this.onChanged,
  });
  final String title;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value == "") {
          return "The field must be complate";
        }
      },
      decoration: InputDecoration(
        label: Text(title),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.pink,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xff588157),
            width: 1,
          ),
        ),
      ),
    );
  }
}
