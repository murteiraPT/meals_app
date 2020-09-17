import 'package:flutter/material.dart';
import 'package:p3_flutter_course/dummy_data.dart';
import '../model/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details-screen';

  Widget buildTitle(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
      alignment: Alignment.center,
    );
  }

  Widget buildListContainer(Widget widget) {
    return Container(
        height: 150,
        width: 300,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: widget);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealDetails =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealDetails.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealDetails.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, "Ingredients"),
            buildListContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        mealDetails.ingredients[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                    ),
                  );
                },
                itemCount: mealDetails.ingredients.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildTitle(context, "Steps"),
            buildListContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(mealDetails.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: mealDetails.steps.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealDetails);
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}
