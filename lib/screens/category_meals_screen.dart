import 'package:flutter/material.dart';

import '../data/dummy_meals.dart';
import '../models/category.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final Category category =
        (ModalRoute.of(context).settings.arguments as Map)['category'];

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categoryIds.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
