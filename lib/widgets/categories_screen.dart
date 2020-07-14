import 'package:flutter/material.dart';
import 'package:meals/data/dummy_categories.dart';
import 'package:meals/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeal')),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItem(
            title: category.title,
            color: category.color,
          );
        }).toList(),
      ),
    );
  }
}
