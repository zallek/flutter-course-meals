import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({
    @required this.favoriteMeals,
  });

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            favoriteMeals[index],
            key: Key(favoriteMeals[index].id),
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
