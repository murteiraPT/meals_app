import 'package:flutter/material.dart';
import '../model/meal.dart';

class MealItem extends StatelessWidget {
  void selectMeal() {}

  final Meal myMeal;

  String get affordabilityText {
    switch (myMeal.affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Expensive:
        return "Expensive";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "N/A";
    }
  }

  String get complexityText {
    switch (myMeal.complexity) {
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Simple:
        return "Simple";
      default:
        return "N/A";
    }
  }

  MealItem(this.myMeal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    myMeal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 25,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      myMeal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${myMeal.duration} min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$complexityText"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$affordabilityText"),
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
