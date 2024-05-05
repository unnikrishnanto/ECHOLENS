import 'package:echolens_v1/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:echolens_v1/dataBase/db_functions.dart';
import 'package:echolens_v1/pages/about_page.dart';
import 'package:echolens_v1/pages/settings_page.dart';
import 'package:echolens_v1/pages/lectures_page.dart';
import 'package:echolens_v1/pages/transcriptor_page.dart';
import "package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;
  double turns = 1;
  @override
  void initState() {
    getAllLectures();
    super.initState();
  }

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
          Builder(builder: (context) {
            return IconButton(
              onPressed: () async {
                setState(() => turns += 1);
                await Future.delayed(const Duration(milliseconds: 300));
                // ignore: use_build_context_synchronously
                Scaffold.of(context).openEndDrawer();
              },
              icon: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(seconds: 1),
                  child: const Icon(Icons.menu)),
              color: Colors.white,
            );
          })
        ],
      ),
      endDrawer: const NavDrawer(),
      body: const HomeScreen(),
    );
  }
}

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
              GestureDetector(
                onTap: () {
                  navigate(context);
                },
                child: const Text(
                  "Tap to connect",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18,
                  ),
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
                                Icons.phone_iphone_outlined,
                                size: 40,
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
                              builder: (ctx) => const LecturesPage()));
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
            ])));
  }

  Future<void> navigate(BuildContext context) async {
    setState(() {
      _paddingBottom = 100;
      _opacity = 0;
    });
    lastResult = '';
    resultText.value = "Click the Start button to start transcription";
    await Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => SplashScreen()),
      );
    });
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text(
              "Settings",
              style: TextStyle(
                  fontFamily: 'poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage()));
            },
            splashColor: const Color.fromARGB(29, 189, 188, 177),
            tileColor: const Color.fromARGB(0, 15, 15, 15),
          ),
          const Divider(
            thickness: 0.1,
            color: Colors.white,
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: const Text(
              "About",
              style: TextStyle(
                  fontFamily: 'poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
            splashColor: const Color.fromARGB(29, 189, 188, 177),
            tileColor: const Color.fromARGB(0, 15, 15, 15),
          ),
          const Divider(
            thickness: 0.1,
            color: Colors.white,
          ),
          ListTile(
            leading: const Icon(
              Icons.bluetooth_audio_rounded,
              color: Colors.white,
            ),
            title: const Text(
              "Bluetooth Settings",
              style: TextStyle(
                  fontFamily: 'poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14),
            ),
            onTap: () {
              FlutterBluetoothSerial.instance.openSettings();
            },
            splashColor: const Color.fromARGB(29, 189, 188, 177),
            tileColor: const Color.fromARGB(0, 15, 15, 15),
          ),
        ],
      ),
    );
  }
}
