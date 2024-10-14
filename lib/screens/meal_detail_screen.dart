import 'package:flutter/material.dart';
import 'package:eating_in_the_name_of/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Recupera a refeição passada como argumento
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            meal.title,
            style: const TextStyle(
              fontFamily: "Raleway", // Fonte utilizada no título
              fontWeight: FontWeight.bold, // Peso da fonte
              fontSize: 20,
            ),
          ),
          foregroundColor: Colors.white, // Cor do texto da barra de aplicativo
          backgroundColor: Colors.pink, // Cor de fundo da barra de aplicativo
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          ],
        ));
  }
}
