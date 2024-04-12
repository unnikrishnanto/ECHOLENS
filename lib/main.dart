import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:echolens_v1/dataBase/lectures_model.dart';
import 'package:echolens_v1/pages/home_page.dart';

bool isConnected = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(LecturesModelAdapter().typeId)) {
    Hive.registerAdapter(LecturesModelAdapter());
  }
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
