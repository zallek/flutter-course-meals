import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Category category =
        (ModalRoute.of(context).settings.arguments as Map)['category'];

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Container(
        child: Text('The Receipes for the category'),
      ),
    );
  }
}
