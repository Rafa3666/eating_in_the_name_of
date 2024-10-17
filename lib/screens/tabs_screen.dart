import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import 'package:eating_in_the_name_of/components/main_drawer.dart';
import 'package:eating_in_the_name_of/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        "title": "Categories List",
        "screen": const CategoriesScreen(),
      },
      {
        "title": "Favorite List",
        "screen": FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  void _selectScreen(int index) {
    setState(
      () {
        _selectedScreenIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]["title"] as String,
        ),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]["screen"]
          as Widget, // Casting para Widget
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps_rounded),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
