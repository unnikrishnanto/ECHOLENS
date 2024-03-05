import 'dart:async';

import 'package:flutter/material.dart';
import 'package:main_project/pages/controls_page.dart';
import 'package:main_project/pages/profile_page.dart';
import 'package:main_project/screens/transcriptor.dart';

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
  // for home button animation
  double _paddingBottom = 15;
  double _opacity =1;
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
                flex: 20,
                child: Container(
                  width: 10,
                ),
              ),
              Expanded(
                flex: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const TranscriptorPage()));
                        },
                        child: const Hero(
                          tag: 'transcriptor-button-icon',
                          child: CircleAvatar(
                              backgroundColor: Color.fromARGB(0, 255, 255, 255),
                              radius: 24,
                              child: Icon(
                                Icons.message,
                                size: 30,
                                color: Color.fromARGB(255, 255, 255, 255),
                              )),
                        ),
                      ),
                    ),
                    AnimatedPadding(
                      duration: const Duration(milliseconds: 240),
                      padding: EdgeInsets.only(top: 0, bottom: _paddingBottom),
                      child: Hero(
                        tag: 'home-button-icon',
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 240),
                          opacity: _opacity,
                          child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: Icon(
                                Icons.home_filled,
                                size: 35,
                                color: Color.fromARGB(212, 34, 167, 123),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const ProfilePage()));
                        },
                        child: const Hero(
                          tag: 'profile-button-icon',
                          child: CircleAvatar(
                              backgroundColor: Color.fromARGB(0, 255, 255, 255),
                              radius: 24,
                              child: Icon(
                                Icons.person_2,
                                size: 40,
                                color: Color.fromARGB(255, 255, 255, 255),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }

  Future<void> navigate(BuildContext context) async {
    setState(() {
      _paddingBottom = 100;
      _opacity = 0;
    });
    await Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const ControlsPage()));
    });
  }
}
