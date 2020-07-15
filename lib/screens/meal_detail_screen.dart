import 'package:flutter/material.dart';

import '../data/dummy_meals.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static String routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final String id = (ModalRoute.of(context).settings.arguments as Map)['id'];
    final Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    Widget buildSectionTitle(BuildContext context, String text) {
      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: meal.ingredients.map((ingredient) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        ingredient,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: meal.steps.asMap().entries.map((entry) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('#${entry.key + 1}'),
                    ),
                    title: Text(entry.value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.of(context).pop(id);
        },
      ),
    );
  }
}
