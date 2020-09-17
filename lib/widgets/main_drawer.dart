import 'package:flutter/material.dart';
import 'package:p3_flutter_course/screens/filters_screen.dart';
import '../screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  void goToTabsSceen(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      TabsScreen.routeName,
    );
  }

  void goToFilterScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
  }

  Widget buildListTile(
      String textTitle, IconData iconType, Function myFunction) {
    return ListTile(
      leading: Icon(
        iconType,
        size: 26,
      ),
      title: Text(
        textTitle,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: myFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
              'Meals', Icons.restaurant, () => goToTabsSceen(context)),
          buildListTile(
              'Filters', Icons.settings, () => goToFilterScreen(context))
        ],
      ),
    );
  }
}
