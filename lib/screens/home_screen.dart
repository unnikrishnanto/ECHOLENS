import 'package:flutter/material.dart';
import 'package:main_project/pages/controls_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //variables for connect button
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Flexible(
                flex: 35,
                child: Container(
                  width: 10,
                ),
              ),
              const Text(
                "Tap to connect",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    navigate(context);
                    setState(() {
                      _color = const Color.fromARGB(30, 255, 255, 255);
                      _height = 110;
                      _width = 110;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 60),
                    width: _width,
                    height: _height,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
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
                  )),
              Flexible(
                flex: 25,
                child: Container(
                  width: 10,
                ),
              ),
              Flexible(
                flex: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: Icon(
                        Icons.chat_rounded,
                        size: 35,
                        color: Color.fromARGB(255, 244, 244, 244),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 3),
                        child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.home_filled,
                              size: 35,
                              color: Color.fromARGB(177, 21, 189, 128),
                            )),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: Icon(
                        Icons.person_2,
                        size: 50,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}

Future<void> navigate(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 60));
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => const ControlsPage()));
}
