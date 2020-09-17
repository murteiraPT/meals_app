import 'package:flutter/material.dart';
import './model/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';
import './dummy_data.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;

      availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void setFavorites(Meal meal) {
    setState(() {
      favoriteMeals.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 22,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      home: TabsScreen(favoriteMeals),
      routes: {
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals, setFavorites),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
        TabsScreen.routeName: (context) => TabsScreen(favoriteMeals),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(setFilters, _filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) =>
                CategoryMealsScreen(availableMeals, setFavorites));
      },
    );
  }
}
