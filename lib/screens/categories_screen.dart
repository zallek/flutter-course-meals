import 'package:flutter/material.dart';

import '../data/dummy_categories.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map((category) {
        return CategoryItem(
          category,
          key: Key(category.id),
        );
      }).toList(),
    );
  }
}
