import 'package:flutter/material.dart';
import 'package:main_project/pages/home_page.dart';
import 'package:main_project/screens/transcriptor.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
      body: const ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

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
                flex: 80,
                child: Container(
                  width: 10,
                ),
              ),
              Flexible(
                flex: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Padding(
                      padding: const EdgeInsets.only(top: 70),
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
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 70,
                      ),
                      child: GestureDetector(
                        onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) =>const HomePage()));
                      },
                        child:const Hero(
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
                    const Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 40),
                      child: Hero(
                        tag: 'profile-button-icon',
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 24,
                            child: Icon(
                              Icons.person_2,
                              size: 35,
                              color: Color.fromARGB(170, 14, 96, 131),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}
