import 'package:cubit_dasar/presentation/create_new_product_screen.dart';
import 'package:cubit_dasar/presentation/detail_product_screen.dart';
import 'package:cubit_dasar/presentation/news_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CreateNewProductScreen());
  }
}
