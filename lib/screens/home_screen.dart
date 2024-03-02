import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color = Colors.transparent;
  double _height = 100;
  double _width = 100;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets\\images\\background.jpeg'),
                fit: BoxFit.fill)),
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Tap to connect",
            style: TextStyle(
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  _color = Color.fromARGB(30, 255, 255, 255);
                  _height = 110;
                  _width = 110;
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: _color,
                ),
                child: Image.asset('assets\\icons\\googles_image.png'),
                onEnd: () {
                  setState(() {
                    _color = Colors.transparent;
                    _height = 105;
                    _height = 105;
                  });
                },
              ))
        ])));
  }
}
