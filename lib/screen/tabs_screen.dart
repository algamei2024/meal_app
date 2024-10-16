import 'package:flutter/material.dart';
import 'package:meal_app/screen/categories_screen.dart';
import 'package:meal_app/screen/favorute_screen.dart';
import 'package:meal_app/screen/filter_screen.dart';
import 'package:meal_app/widgets/minDrawer.dart';

class tabsScreen extends StatefulWidget {
  @override
  State<tabsScreen> createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {
  int selectedPageIndex = 0;
  void selectPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  final List pages = [
    [
      CategoriesScreen(),
      'Categoreis',
    ],
    [
      favourteScreen(),
      'Favorite',
    ],
  ];
//----------------------------
  Widget buildListTile(
      BuildContext context, String txt, icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(txt,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w700,
          )),
      onTap: tapHandler(),
    );
  }

  void routfilterscreen(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return filterScreen();
    }));
  }

  void routtabsscreen(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return tabsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex][1]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items:[
          BottomNavigationBarItem(
            label: "Categoreis",
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: "Favourte",
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 100,
            alignment: Alignment.center,
            child: Text(
              "Cooking Up..",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return filterScreen();
                }));
              },
              child: Text("Filter Screen")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("tabs Screen")),
        ]),
      ),
      body: pages[selectedPageIndex][0],
    );
  }
}
