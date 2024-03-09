import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:main_project/pages/transcriptor_page.dart';

class ExpandedText extends StatefulWidget {
  const ExpandedText({super.key});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
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
          title: const Text(
            "Expanded",
            style: TextStyle(
              color: Color.fromARGB(250, 246, 246, 246),
              fontFamily: 'poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: GestureDetector(
          onDoubleTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets\\images\\background.jpeg'),
                      fit: BoxFit.fill)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  width: 300,
                  height: 600,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(227, 179, 22, 166),
                          Color.fromARGB(255, 28, 216, 233)
                        ]),
                        width: 5,
                      ),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Text(
                      resultText,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'courier',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ))),
        ));
  }
}
