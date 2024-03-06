import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:main_project/pages/home_page.dart';
import 'package:main_project/pages/profile_page.dart';

String resultText =
    "This is the transcripted text.Which will be displayed continuously in real time as the microphone records the audio.\n this diaplaybox can be scrolled\n new line\n new line\n new line\n new line\n new line\n new line\n new line\n new line\n new line";

class TranscriptorPage extends StatelessWidget {
  const TranscriptorPage({super.key});

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
          child: Image.asset(
            'assets\\icons\\googles_image.png',
            fit: BoxFit.contain,
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
      body: const TranscriptorBody(),
    );
  }
}

class TranscriptorBody extends StatelessWidget {
  const TranscriptorBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets\\images\\background.jpeg'),
                fit: BoxFit.fill)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(
            flex: 80,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30, right: 60),
                  child: Text(
                    "MOBILE PHONE TRANSCRIPTION",
                    style: TextStyle(
                      fontFamily: 'canvas',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 200,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            'assets\\icons\\mobile_phone_icon.png',
                            height: 45,
                            width: 45,
                          ),
                          Image.asset(
                            'assets\\icons\\microphone-icon.png',
                            width: 26,
                            height: 28,
                          ),
                        ],
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                          width: 100,
                          height: 48,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              'assets\\icons\\arrow-icons-black.png',
                              fit: BoxFit.fill,
                            ),
                          )),
                      Image.asset(
                        'assets/icons/cc_icon.png',
                        height: 45,
                        width: 35,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    width: 280,
                    height: 200,
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
                )
              ],
            ),
          ),
          Flexible(
            flex: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 40),
                  child: Hero(
                    tag: 'transcriptor-button-icon',
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24,
                        child: Icon(
                          Icons.message,
                          size: 30,
                          color: Color.fromARGB(170, 14, 96, 131),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 70,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => const HomePage()));
                    },
                    child: const Hero(
                      tag: 'home-button-icon',
                      child: CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 14, 96, 131),
                          radius: 24,
                          child: Icon(
                            Icons.home_filled,
                            size: 38,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
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
        ]));
  }
}
