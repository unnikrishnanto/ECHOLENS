import 'package:flutter/material.dart';
import 'package:main_project/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 23, 48, 149)),
      home: const HomePage(),
    );
  }
}
