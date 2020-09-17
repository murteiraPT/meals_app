import 'package:flutter/material.dart';
import 'package:p3_flutter_course/widgets/meal_item.dart';
import '../model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals-screen';
  final Function addToFavorites;
  final List<Meal> myList;

  CategoryMealsScreen(this.myList, this.addToFavorites);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final id = routeArgs['id'];

      displayedMeals = widget.myList
          .where((element) => element.categories.contains(id))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void addFavorite(Meal meal) {
    widget.addToFavorites(meal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              myMeal: displayedMeals[index], addToFavoritesMeal: addFavorite);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
