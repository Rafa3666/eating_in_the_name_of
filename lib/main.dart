// Importa a classe Category do modelo de dados da aplicação
import 'package:eating_in_the_name_of/models/category.dart';
// Importa as bibliotecas necessárias do Flutter
import 'package:flutter/material.dart';
// Importa as telas que serão utilizadas na navegação
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

// Função principal que inicia o aplicativo
void main() {
  runApp(const MyApp()); // Executa o widget MyApp
}

// Define a classe MyApp, que é um StatelessWidget
class MyApp extends StatelessWidget {
  // Construtor da classe MyApp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define o widget principal da aplicação
      home: Scaffold(
        // Cria um Scaffold, que fornece estrutura básica para a interface
        appBar: AppBar(
          // Configura a barra de aplicativo
          title: const Center(
            // Alinha o título ao centro
            child: Text(
              "Let's Cook?", // Título da aplicação
              style: TextStyle(
                fontFamily: "Raleway", // Fonte utilizada no título
                fontWeight: FontWeight.bold, // Peso da fonte
                fontSize: 20, // Tamanho da fonte
              ),
            ),
          ),
          foregroundColor: Colors.white, // Cor do texto da barra de aplicativo
          backgroundColor: Colors.pink, // Cor de fundo da barra de aplicativo
        ),
        body:
            const CategoriesScreen(), // Corpo da aplicação, que exibe a tela de categorias
      ),
      // Define as rotas da aplicação
      routes: {
        AppRoutes.CATEGORIES_MEALS: (ctx) {
          // Quando a rota "/categories-meals" é chamada
          // Extrai a categoria passada como argumento
          final category = ModalRoute.of(ctx)?.settings.arguments as Category;
          // Retorna a tela de refeições da categoria, passando a categoria como argumento
          return CategoriesMealsScreen(category);
        },
      },
    );
  }
}
