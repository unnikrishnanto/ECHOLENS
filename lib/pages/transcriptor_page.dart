import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:main_project/pages/home_page.dart';
import 'package:main_project/pages/lectures_page.dart';
import 'package:main_project/screens/expanded_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';

ValueNotifier<String> resultText =
    ValueNotifier("Click the Start button to start transcription");

class TranscriptorPage extends StatelessWidget {
  const TranscriptorPage({super.key});

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
      body: const TranscriptorBody(),
    );
  }
}

class TranscriptorBody extends StatefulWidget {
  const TranscriptorBody({
    super.key,
  });

  @override
  State<TranscriptorBody> createState() => _TranscriptorBodyState();
}

class _TranscriptorBodyState extends State<TranscriptorBody> {
  bool isTranscripting = false;
  SpeechToText st = SpeechToText();

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
                // ignore: sized_box_for_whitespace
                Container(
                  height: 90,
                  width: 200,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          startTranscription();
                        },
                        child: AvatarGlow(
                          animate: isTranscripting,
                          glowColor: const Color.fromARGB(255, 30, 192, 236),
                          duration: const Duration(milliseconds: 2000),
                          repeat: true,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const Icon(
                                  Icons.phone_android_outlined,
                                  size: 40,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    Icons.mic_none_outlined,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 63),
                                  child: !isTranscripting
                                      ? const Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : const Text(
                                          'STOP',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                          width: 100,
                          height: 48,
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 4, left: 4, right: 4),
                              child: Icon(
                                Icons.arrow_right_alt_outlined,
                                size: 40,
                                color: Colors.white,
                              ))),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset(
                          'assets/icons/cc_icon.png',
                          height: 45,
                          width: 35,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ExpandedText()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.3,
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
                        reverse: true,
                        child: ValueListenableBuilder(
                            valueListenable: resultText,
                            builder: (context, value, child) {
                              return Text(
                                resultText.value,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'courier',
                                    fontWeight: FontWeight.w900),
                              );
                            }),
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
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.phone_android_outlined,
                              size: 35,
                              color: Color.fromARGB(170, 14, 96, 131),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(
                                Icons.mic_none_outlined,
                                color: Color.fromARGB(177, 41, 95, 113),
                                size: 20,
                              ),
                            )
                          ],
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
        ]));
  }

  void startTranscription() async {
    if (!isTranscripting) {
      setState(() {
        isTranscripting = true;
      });
      var available = await st.initialize();
      if (available) {
        st.listen(onResult: ((result) {

            resultText.value = result.recognizedWords;
            resultText.notifyListeners();

        }));
      }
    } else {
      setState(() {
        isTranscripting = false;
      });
      st.stop();
    }
  }
}
