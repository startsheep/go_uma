import 'package:flutter/material.dart';
import 'package:go_uma/app/modules/home/controllers/home_controller.dart';
import 'package:go_uma/app/widgets/card_content_product.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
//
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return CardContentProduct(
            title: controller.categories[index]['name'],
          );
        },
      ),
    );
  }
}
