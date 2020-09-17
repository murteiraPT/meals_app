import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteList;

  FavoriteScreen(this.favoriteList);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteList.length == 0
          ? Text("Select your favorites")
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(
                    myMeal: favoriteList[index], addToFavoritesMeal: () {});
              },
              itemCount: favoriteList.length,
            ),
    );
  }
}
