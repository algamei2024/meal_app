import 'package:flutter/material.dart';
import 'package:meal_app/widgets/minDrawer.dart';

class filterScreen extends StatefulWidget {
  const filterScreen({super.key});
  static const routeName = 'filterscreen';
  @override
  State<filterScreen> createState() => _filterScreenState();
}

bool gluteenfree = false;
bool locatoesfree = false;
bool vegen = false;
bool vegetaren = false;

class _filterScreenState extends State<filterScreen> {
  Widget buildSwitchListTile(String titl, String sbtitl, bool varable) {
    return SwitchListTile(
        title: Text('$titl'),
        subtitle: Text('$sbtitl'),
        value: varable,
        onChanged: (value) {
          setState(() {
            varable = value;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your filter"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Adjust Your meal filter"),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    "Gluteen-Free", "Only Include Gluteen Meal", gluteenfree),
                buildSwitchListTile(
                    "Locatoes", "Only Include locatoesfree Meal", locatoesfree),
                buildSwitchListTile(
                    "Vega-Free", "Only Include Vega Meal", vegen),
                buildSwitchListTile(
                    "Vegen-Free", "Only Include vegen Meal", vegen),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
