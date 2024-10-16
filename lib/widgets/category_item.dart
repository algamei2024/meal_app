import 'package:flutter/material.dart';
import 'package:meal_app/screen/categorey_meal_screen.dart';

class CategoryItme extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItme(this.id, this.title, this.color);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
        arguments: {'id': this.id, 'title': this.title});
  }
  
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Text(this.title, style: Theme.of(context).textTheme.headline1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              this.color.withOpacity(0.5),
              this.color,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
