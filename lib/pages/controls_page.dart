import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:main_project/pages/home_page.dart';

String? devicename = '********';

class ControlsPage extends StatelessWidget {
  const ControlsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 0, top: 15, bottom: 15),
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Hero(
            tag: "goggles",
            child: Image.asset(
              'assets\\icons\\googles_image.png',
              fit: BoxFit.contain,
            ),
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
                                Icons.headset_off,
                                size: 38,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.headset_rounded,
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
                          "CONTROLS",
                          style: TextStyle(
                              fontFamily: 'cooper',
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 14),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 40, top: 20),
                      child: Icon(
                        Icons.tune,
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
              Icons.power_settings_new_rounded,
              color: Colors.white,
              size: 30,
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
        ],
      ),
    );
  }
}
