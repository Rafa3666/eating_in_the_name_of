// Importa as bibliotecas necessárias
import 'package:flutter/material.dart';
import 'package:eating_in_the_name_of/models/category.dart';
import 'package:eating_in_the_name_of/utils/app_routes.dart';

// Importa as telas que serão utilizadas na navegação
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart'; // Importa a tela de detalhes da refeição

void main() {
  runApp(const MyApp()); // Executa o widget MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Let's Cook?",
              style: TextStyle(
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.pink,
        ),
        body: const CategoriesScreen(),
      ),
      routes: {
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(), // Certo agora
        AppRoutes.CATEGORIES_MEALS: (ctx) {
          final category = ModalRoute.of(ctx)?.settings.arguments as Category;
          return CategoriesMealsScreen(category);
        },
      },
    );
  }
}
