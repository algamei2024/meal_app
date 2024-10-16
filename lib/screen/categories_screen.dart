import 'package:flutter/material.dart';
import 'package:meal_app/1.2%20dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_categories.map((catData) {
          return CategoryItme(catData.id , catData.title , catData.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
