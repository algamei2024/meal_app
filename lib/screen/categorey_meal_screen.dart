import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/1.2%20dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meal';
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  var categoryMeals;
  var categorytitle;
  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryid = routeArg['id'];
    categorytitle = routeArg['title'];
    categoryMeals =
        DUMMY_MealS.where((item) => item.categories.contains(categoryid))
            .toList();
    super.didChangeDependencies();
  }

  void removeMeal(String malid) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == malid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle.toString()),
      ),
      drawer: Drawer(),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return mealItem(categoryMeals[index], removeMeal);
        },
      ),
    );
  }
}
