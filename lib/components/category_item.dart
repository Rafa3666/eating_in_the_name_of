// Importa as bibliotecas necessárias do Flutter e a classe Category
import 'package:eating_in_the_name_of/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:eating_in_the_name_of/models/category.dart';

// Define o item de categoria que será exibido na tela
class CategoryItem extends StatelessWidget {
  final Category category; // Propriedade que representa a categoria

  const CategoryItem(this.category,
      {super.key}); // Construtor que recebe a categoria

  // Método para selecionar uma categoria e navegar para a tela de refeições
  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS, // Rota para a tela de refeições
      arguments: category, // Passa a categoria como argumento
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context), // Chama o método ao tocar no item
      splashColor: Theme.of(context).primaryColor, // Cor do efeito de toque
      borderRadius: BorderRadius.circular(10), // Raio das bordas do efeito
      child: Container(
        padding: const EdgeInsets.all(12), // Espaçamento interno
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10), // Raio das bordas do contêiner
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5), // Cor da categoria com opacidade
              category.color, // Cor da categoria
            ],
            begin: Alignment.topLeft, // Ponto de início do gradiente
            end: Alignment.bottomRight, // Ponto final do gradiente
          ),
        ),
        child: Text(
          category.title, // Título da categoria
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontFamily: "RobotoCondensed", // Fonte do texto
                fontSize: 21, // Tamanho da fonte
              ),
        ),
      ),
    );
  }
}
