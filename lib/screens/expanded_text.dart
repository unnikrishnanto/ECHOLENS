import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:main_project/pages/transcriptor_page.dart';

class ExpandedText extends StatefulWidget {
  const ExpandedText({super.key});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  double _fontSize = 16;
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
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets\\images\\background.jpeg'),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onDoubleTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 300,
                    height: MediaQuery.of(context).size.height * 0.8,
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
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'courier',
                            fontWeight: FontWeight.w900,
                            fontSize: _fontSize),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _fontSize--;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        )),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(151, 211, 202, 202),
                          borderRadius: BorderRadius.circular(2)),
                      child: const Text(
                        "FONT SIZE",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _fontSize++;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            )));
  }
}
