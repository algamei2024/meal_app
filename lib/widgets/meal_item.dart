import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meal_datiles_screen.dart';

class mealItem extends StatelessWidget {
  var categorys;
  Function removeitem;
  mealItem(this.categorys, this.removeitem);
  //هنا نرجع درجة تعقيد التحضير
  String complex(complext) {
    String txt = '';
    switch (complext) {
      case Complexity.Simple:
        txt = "Simple";
        break;
      case Complexity.Hard:
        txt = "Hard";
        break;
      case Complexity.Challenging:
        txt = "Challeng";
        break;
      default:
        txt = "Unknow";
        break;
    }
    return txt;
  }

  String affability(affabil) {
    String txt = '';
    switch (affabil) {
      case Affordability.Affordable:
        txt = "Affordable";
        break;
      case Affordability.Luxurious:
        txt = "Luxurious";
        break;
      case Affordability.Pricey:
        txt = "Pricey";
        break;
      default:
        txt = "Unknow";
        break;
    }
    return txt;
  }

  //دالة الانتقال الي عرض المعلومات
  void selectMeal(BuildContext context, categorys) {
    Navigator.of(context)
        .pushNamed(mealDetiles.routName, arguments: categorys)
        .then((value) {
      if (value != null) {
        removeitem(value);
      }
    });
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context, categorys),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image(
                  image: NetworkImage(this.categorys.imagUrl),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 15,
                  child: Container(
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        this.categorys.title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ))),
            ]),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${categorys.duration} min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${complex(categorys.complexity)}"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text("${affability(categorys.affordability)}"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
