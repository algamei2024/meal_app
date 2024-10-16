import 'package:flutter/material.dart';
import 'package:meal_app/screen/categorey_meal_screen.dart';
import 'package:meal_app/screen/categories_screen.dart';
import 'package:meal_app/screen/filter_screen.dart';
import 'package:meal_app/screen/meal_datiles_screen.dart';
import 'package:meal_app/screen/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'meal_app',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 229, 37, 37),
        primarySwatch: Colors.indigo,
        primaryColorLight: Color.fromARGB(255, 227, 127, 6),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: const Color.fromARGB(255, 76, 120, 175),
              ),
              bodyText2: TextStyle(
                color: const Color.fromARGB(255, 175, 173, 76),
              ),
              headline1: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
      ),
      home:tabsScreen(),
     routes:{
      'main':(context)=>tabsScreen(),
      CategoryMealScreen.routeName:(context) => CategoryMealScreen(),
      mealDetiles.routName:(context) => mealDetiles(),
      filterScreen.routeName:(context)=>filterScreen(),
     }
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meal App"),
        ),
        body: CategoriesScreen());
  }
}
