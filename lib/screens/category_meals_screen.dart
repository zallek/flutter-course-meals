import 'package:flutter/material.dart';

import '../data/dummy_categories.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category category;
  List<Meal> categoryMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final String id = (ModalRoute.of(context).settings.arguments as Map)['id'];
    category = DUMMY_CATEGORIES.firstWhere((meal) => meal.id == id);
    categoryMeals = widget.availableMeals
        .where((meal) => meal.categoryIds.contains(category.id))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            categoryMeals[index],
            key: Key(categoryMeals[index].id),
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
