import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        automaticallyImplyLeading: false,
        title: const Text(
          "Settings",
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontFamily: 'poppins',
              fontSize: 15,
              color: Colors.white),
        ),
        titleSpacing: 20,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 41, 40, 40),
      ),
    );
  }
}
