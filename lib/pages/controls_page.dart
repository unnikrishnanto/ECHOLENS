import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:main_project/dataBase/db_functions.dart';
import 'package:main_project/dataBase/lectures_model.dart';
import 'package:main_project/main.dart';
import 'package:main_project/pages/home_page.dart';
import 'package:main_project/pages/lectures_page.dart';
import 'package:main_project/pages/transcriptor_page.dart';
import 'package:main_project/screens/expanded_text.dart';
import 'package:speech_to_text/speech_to_text.dart';

String? devicename = '********';
TextEditingController lectureName = TextEditingController();
TextEditingController lectureDuration = TextEditingController();
int lectureId = -1;
double turns = 1;

class ControlsPage extends StatefulWidget {
  const ControlsPage({super.key});

  @override
  State<ControlsPage> createState() => _ControlsPageState();
}

class _ControlsPageState extends State<ControlsPage> {
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
  SpeechToText st = SpeechToText();
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
            padding: const EdgeInsets.only(right: 80, bottom: 20),
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
          Expanded(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
              crossAxisSpacing: 20,
              children: [
                GestureDetector(
                  onTap: () {
                    startTranscribing();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 25, right: 15, bottom: 20, top: 20),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets\\images\\controls_background.jpeg'),
                            fit: BoxFit.contain),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                  margin: const EdgeInsets.only(
                      left: 15, right: 25, bottom: 20, top: 20),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets\\images\\controls_background.jpeg'),
                          fit: BoxFit.contain),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
                GestureDetector(
                  onTap: () {
                    if (_isStarted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Transcription in progress.save the lecture before starting transcription."),
                        duration: Duration(seconds: 3),
                      ));
                    } else {
                      lectureDuration.text = '2';
                      showDialog(
                          context: context,
                          builder: (context) => const LectureDetails());
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 25, right: 15, bottom: 20, top: 20),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets\\images\\controls_background.jpeg'),
                            fit: BoxFit.contain),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 15, right: 25, bottom: 20, top: 20),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets\\images\\controls_background.jpeg'),
                          fit: BoxFit.contain),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
          ),
          GestureDetector(
            onTap: () => disconnect(context),
            child: const Text(
              "Tap to disconnect ",
              style: TextStyle(
                color: Color.fromARGB(252, 255, 255, 255),
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                disconnect(context);
              },
              child: const Icon(
                Icons.link_off_outlined,
                color: Colors.white,
                size: 40,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
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
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
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
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> disconnect(BuildContext context) async {
    isConnected = false;
    st.stop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => const HomePage()),
    );
  }

  void startTranscribing() async {
    if (!_isStarted) {
      setState(() {
        _isStarted = true;
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
        _isStarted = false;
      });
      if (lectureId >= 0) {
        await saveLectureInDb(lectureId, resultText.value);
        lectureId = -1;
      }

      st.stop();
    }
  }
}

class LectureDetails extends StatelessWidget {
  const LectureDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(230, 78, 190, 255),
            border: GradientBoxBorder(
              gradient: LinearGradient(colors: [
                Color.fromARGB(246, 11, 208, 226),
                Color.fromARGB(255, 26, 170, 64)
              ], begin: Alignment.centerLeft, end: Alignment.bottomRight),
              width: 5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.all(10),
        width: 300,
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: lectureName,
              decoration: const InputDecoration(
                  hintText: "Lecture Name",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 254, 254))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(225, 20, 202, 129)))),
            ),
            TextField(
              controller: lectureDuration,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "Lecture Duration (Default 2 hrs)",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 254, 254))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(225, 20, 202, 129)))),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: const Color.fromARGB(255, 7, 143, 170)),
                onPressed: () async {
                  if (lectureName.text.isNotEmpty) {
                    final duration = int.tryParse(lectureDuration.text);
                    print("${duration.runtimeType} : $duration");
                    final lecture =
                        LecturesModel(lectureName: lectureName.value.text);
                    await addLecture(lecture);
                    lectureName.clear();
                    lectureDuration.clear();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text(
                  "+ADD",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
