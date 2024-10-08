import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Let's cook?",
      color: Colors.white,
      home: CategoriesScreen(),
    );
  }
}
