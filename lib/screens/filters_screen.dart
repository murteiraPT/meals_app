import 'package:flutter/material.dart';
import 'package:p3_flutter_course/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/filterScreen';
  final Function setFilters;

  Map<String, bool> mainFilters;
  FiltersScreen(this.setFilters, this.mainFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree;
  bool vegan;
  bool vegetarian;
  bool lactoseFree;

  @override
  void initState() {
    glutenFree = widget.mainFilters['gluten'];
    vegan = widget.mainFilters['vegan'];
    vegetarian = widget.mainFilters['vegetarian'];
    lactoseFree = widget.mainFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Choose Favorites"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () => widget.setFilters({
                    'gluten': glutenFree,
                    'lactose': lactoseFree,
                    'vegetarian': vegetarian,
                    'vegan': vegan,
                  }))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                    title: Text("Gluten free"),
                    subtitle: Text("Only includes gluten free meals"),
                    value: glutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        glutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Vegan"),
                    subtitle: Text("Only includes vegan meals"),
                    value: vegan,
                    onChanged: (newValue) {
                      setState(() {
                        vegan = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Vegetarian"),
                    subtitle: Text("Only includes vegetarian meals"),
                    value: vegetarian,
                    onChanged: (newValue) {
                      setState(() {
                        vegetarian = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Lactose free"),
                    subtitle: Text("Only includes lactose free meals"),
                    value: lactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        lactoseFree = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
