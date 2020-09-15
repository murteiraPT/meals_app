import 'package:flutter/material.dart';
import 'package:p3_flutter_course/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final routeName = '/category-meals-screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final title = routeArgs['title'];
    final id = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
