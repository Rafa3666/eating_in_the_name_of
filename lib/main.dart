// Importa as bibliotecas necessárias
import 'package:eating_in_the_name_of/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:eating_in_the_name_of/utils/app_routes.dart';

// Importa as telas que serão utilizadas na navegação
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
import 'package:eating_in_the_name_of/models/meal.dart';
import 'package:eating_in_the_name_of/data/dummy_data.dart';

void main() {
  runApp(const MyApp()); // Executa o widget MyApp
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where(
        (meal) {
          final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
          final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
          final filterVegan = settings.isVegan && !meal.isVegan;
          final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
          return !filterGluten &&
              !filterLactose &&
              !filterVegetarian &&
              !filterVegan;
        },
      ).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      favoriteMeals.contains(meal)
          ? favoriteMeals.remove(meal)
          : favoriteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TabsScreen(favoriteMeals),
      ),
      routes: {
        AppRoutes.MEAL_DETAIL: (ctx) =>
            MealDetailScreen(_toggleFavorite, isFavorite),
        AppRoutes.HOME: (ctx) => TabsScreen(favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
