// Importa a classe Category e as bibliotecas do Flutter
import 'package:eating_in_the_name_of/components/meal_item.dart';
import 'package:eating_in_the_name_of/models/category.dart';
import 'package:flutter/material.dart';
import 'package:eating_in_the_name_of/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals, {super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém a categoria passada como argumento da rota
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final CategoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        // Define o título da barra de aplicativo como o nome da categoria
        title: Text(category.title),
        backgroundColor: Colors.pink, // Cor de fundo da barra
        foregroundColor: Colors.white, // Cor do texto da barra
      ),
      body: ListView.builder(
        itemCount: CategoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(CategoryMeals[index]);
        },
      ),
    );
  }
}
