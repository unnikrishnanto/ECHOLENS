import 'package:flutter/material.dart';
import 'package:main_project/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 23, 48, 149)
      ),
      home:const HomePage(),
    );
  }
}