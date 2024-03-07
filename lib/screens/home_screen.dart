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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //variables for connect button
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  // for home button animation
  double _paddingBottom = 15;
  double _opacity = 1;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _opacityAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 1), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 1, end: 0), weight: 50),
    ]).animate(_controller);
    _controller.repeat();

    _controller.addListener(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              GestureDetector(
                  onTap: () {
                    navigate(context);
                  },
                  child: AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, _) {
                        return Opacity(
                            opacity: _opacityAnimation.value,
                            child: Image.asset(
                              'assets\\icons\\connect_icon.png',
                              width: 70,
                              height: 70,
                              fit: BoxFit.fill,
                            ));
                      })),
              const Text(
                "Tap to connect",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
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
