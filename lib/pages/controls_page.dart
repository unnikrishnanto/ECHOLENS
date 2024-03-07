import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:main_project/pages/home_page.dart';
import 'package:main_project/pages/lectures_page.dart';
import 'package:main_project/screens/expanded_text.dart';

String? devicename = '********';

class ControlsPage extends StatelessWidget {
  const ControlsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(
          padding: const EdgeInsets.only(top: 7),
          margin:
              const EdgeInsets.only(left: 10, right: 0, top: 15, bottom: 15),
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Stack(
            children: [
              Image.asset(
                'assets\\icons\\googles_image.png',
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 1),
                child: Image.asset(
                  'assets\\icons\\googles_bar.jpg',
                  width: 12,
                  height: 5,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        title: const Text(
          "ECHOLENS",
          style: TextStyle(
            color: Color.fromARGB(250, 246, 246, 246),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        titleSpacing: 5,
        actions: [
          IconButton(
            onPressed: () {
              print('pressed');
            },
            icon: const Icon(Icons.menu),
            color: Colors.white,
          )
        ],
      ),
      body: const ControlsBody(),
    );
  }
}

class ControlsBody extends StatefulWidget {
  const ControlsBody({
    super.key,
  });

  @override
  State<ControlsBody> createState() => _ControlsBodyState();
}

class _ControlsBodyState extends State<ControlsBody> {
  bool _isStarted = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets\\images\\background.jpeg'),
        fit: BoxFit.fill,
      )),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 100, top: 10),
            child: Text(
              "Connection Sucecssful ",
              style: TextStyle(
                color: Color.fromARGB(252, 255, 255, 255),
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 80, bottom: 40),
            child: Text(
              "with $devicename",
              style: const TextStyle(
                color: Color.fromARGB(252, 255, 255, 255),
                fontFamily: 'poppins',
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isStarted = !_isStarted;
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets\\images\\controls_background.jpeg')),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 9, right: 22),
                          child: Column(
                            children: [
                              _isStarted
                                  ? const Text(
                                      "STOP",
                                      style: TextStyle(
                                          fontFamily: 'cooper',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16),
                                    )
                                  : const Text(
                                      "START",
                                      style: TextStyle(
                                          fontFamily: 'cooper',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16),
                                    ),
                              const Text(
                                'Transcribe',
                                style: TextStyle(
                                  fontFamily: 'courier',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 12),
                        child: _isStarted
                            ? const Icon(
                                Icons.stop_circle,
                                size: 38,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.play_circle_fill,
                                size: 38,
                                color: Colors.white,
                              ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets\\images\\controls_background.jpeg')),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 100,
                height: 100,
                child: const Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 9, right: 5),
                        child: Column(
                          children: [
                            Text(
                              "BATTERY",
                              style: TextStyle(
                                  fontFamily: 'cooper',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16),
                            ),
                            Text(
                              'Percentage    ',
                              style: TextStyle(
                                fontFamily: 'courier',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 40, top: 12),
                      child: Icon(
                        Icons.battery_5_bar_outlined,
                        size: 38,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets\\images\\controls_background.jpeg')),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 100,
                height: 100,
                child: const Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text(
                          "SAVE\nLECTURE",
                          style: TextStyle(
                              fontFamily: 'cooper',
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 14),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 40,
                      ),
                      child: Icon(
                        Icons.post_add_outlined,
                        size: 38,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets\\images\\controls_background.jpeg')),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 100,
                height: 100,
                child: const Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text(
                          "SIGNAL\nSTRENGTH",
                          style: TextStyle(
                              fontFamily: 'cooper',
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 13),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 40, top: 5),
                      child: Icon(
                        Icons.signal_cellular_alt,
                        size: 38,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
            height: 50,
          ),
          const Text(
            "Tap to disconnect ",
            style: TextStyle(
              color: Color.fromARGB(252, 255, 255, 255),
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => const HomePage()));
              },
              child: const Icon(
                Icons.link_off_outlined,
                color: Colors.white,
                size: 40,
              )),
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
                          builder: (ctx) => const ExpandedText()));
                    },
                    child: const Hero(
                      tag: 'transcriptor-button-icon',
                      child: CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          radius: 24,
                          child: Icon(
                            Icons.phone_iphone_outlined,
                            size: 40,
                            color: Color.fromARGB(255, 255, 255, 255),
                          )),
                    ),
                  ),
                ),
                const Hero(
                  tag: 'home-button-icon',
                  child: CircleAvatar(
                      backgroundColor: Color.fromARGB(0, 255, 255, 255),
                      radius: 24,
                      child: Icon(
                        Icons.home_filled,
                        size: 35,
                        color: Color.fromARGB(0, 14, 96, 131),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                    },
                    child: const Hero(
                      tag: 'profile-button-icon',
                      child: CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          radius: 24,
                          child: Icon(
                            Icons.menu_book,
                            size: 40,
                            color: Color.fromARGB(255, 255, 255, 255),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
