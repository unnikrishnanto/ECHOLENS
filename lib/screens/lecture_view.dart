import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LectureView extends StatelessWidget {
  String name;
  String content;
  LectureView({super.key, required this.name, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            size: 40,
            color: Colors.white,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Color.fromARGB(250, 246, 246, 246),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Text(
            content,
            style: const TextStyle(fontFamily: 'poppins', color: Colors.white),
          ),
        ),
      ),
    );
  }
}
