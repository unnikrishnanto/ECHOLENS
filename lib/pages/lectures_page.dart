import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
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
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 30, right: 150),
                      child: Text(
                        "SAVED LECTURES",
                        style: TextStyle(
                          fontFamily: 'canvas',
                          fontSize: 16,
                          color: Colors.white,
                        ),
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
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ListTile(
                                  leading: Text(
                                    "${index + 1}",
                                    style: const TextStyle(
                                      color: Color.fromARGB(250, 246, 246, 246),
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  title: Text(
                                    "Lectrure ${index + 1}",
                                    style: const TextStyle(
                                      color: Color.fromARGB(250, 246, 246, 246),
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                  //   trailing: Row(
                                  //     children: [
                                  //       ElevatedButton(
                                  //           onPressed: () {}, child: const Text("VIEW")),
                                  //       ElevatedButton.icon(
                                  //           onPressed: () {},
                                  //           icon:const Icon(Icons.delete),
                                  //           label: const Text("DELETE"))
                                  //   ],
                                  // ),
                                  );
                            },
                            separatorBuilder: (ctx, index) => const Divider(),
                            itemCount: 3),
                      ),
                    ),
                  ],
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
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
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
                    const Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 40),
                      child: Hero(
                        tag: 'profile-button-icon',
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 24,
                            child: Icon(
                              Icons.menu_book,
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
