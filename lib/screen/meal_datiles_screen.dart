import 'package:flutter/material.dart';

class mealDetiles extends StatelessWidget {
  //]دالة إنشاء العناوين
  Widget buildSectionTitl(BuildContext context, String txt) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text("$txt", style: Theme.of(context).textTheme.headline1),
    );
  }

  //دالة إنشاء الخطواط
  Widget buildContainer(BuildContext context, itemChild, num) {
    var subChild;
    if (num == 1) {
      subChild = (
        context,
        inedx,
      ) {
        return Card(
          shadowColor: Colors.black38,
          elevation: 10,
          margin: EdgeInsets.all(5),
          color: Theme.of(context).primaryColorLight,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(itemChild[inedx],
                  style: TextStyle(color: Colors.white))),
        );
      };
    } else if (num == 2) {
      subChild = (
        context,
        index,
      ) {
        return Column(children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(itemChild[index]),
          ),
          Divider(
            thickness: 3,
          ),
        ]);
      };
    }

    //بالاخير يرجع كونتاينر بداخله ليست بداخل الليست محتوى منسق فوق
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Color.fromARGB(255, 79, 165, 48)),
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        height: 200,
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itemChild.length,
          itemBuilder: subChild,
        ));
  }

  static const routName = 'mealDetiles';
  @override
  Widget build(BuildContext context) {
    var categorys;
    categorys = ModalRoute.of(context)?.settings.arguments;
     
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(categorys.id);
          },
          child: Icon(Icons.delete)),
      appBar: AppBar(title: Text('${categorys.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(categorys.imagUrl, fit: BoxFit.cover),
            ),
            buildSectionTitl(context, "Ingradiants"),
            buildContainer(context, categorys.ingredients, 1),
            buildSectionTitl(context, "Steps"),
            buildContainer(context, categorys.steps, 2),
          ],
        ),
      ),
    );
  }
}
