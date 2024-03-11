import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:main_project/main.dart';
import 'package:main_project/pages/home_page.dart';
import 'package:main_project/pages/transcriptor_page.dart';

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
    int count = 10;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets\\images\\background.jpeg'),
                fit: BoxFit.fill)),
        child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Flexible(
            flex: 80,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 40, right: 150),
                  child: Text(
                    "SAVED LECTURES",
                    style: TextStyle(
                      fontFamily: 'canvas',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 280,
                      height: count < 5 ? (count * 60) : 350,
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
                      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.only(left: 10, right: 5),
                              horizontalTitleGap: 5,
                              leading: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                  color: Color.fromARGB(250, 246, 246, 246),
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              title: Container(
                                padding: const EdgeInsets.only(
                                    top: 3, left: 6, bottom: 2, right: 4),
                                decoration: const BoxDecoration(
                                    border: Border(
                                  top: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(235, 176, 163, 40)),
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(235, 176, 163, 40)),
                                  left: BorderSide(
                                      width: 2,
                                      color: Color.fromARGB(245, 235, 212, 12)),
                                  right: BorderSide(
                                      width: 2,
                                      color: Color.fromARGB(245, 235, 212, 12)),
                                )),
                                child: Text(
                                  "Lectrure   ${index + 1}",
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Color.fromARGB(250, 246, 246, 246),
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 5, bottom: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color.fromARGB(251, 0, 0, 0),
                                              Color.fromARGB(255, 23, 189, 20)
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.center,
                                          ),
                                        ),
                                        width: 60,
                                        height: 30,
                                        child: const Text(
                                          "VIEW",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: Color.fromARGB(255, 184, 65, 65),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) => const Divider(),
                          itemCount: count),
                    ),
                  ),
                ),
              ],
            ),
          ),
// NAvigation bar
          Flexible(
              flex: 20,
              child: !isConnected //checking weather status is falae
                  ? Row(
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
                                  backgroundColor:
                                      Color.fromARGB(0, 255, 255, 255),
                                  radius: 24,
                                  child: Icon(
                                    Icons.phone_iphone_outlined,
                                    size: 40,
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
                                  backgroundColor:
                                      Color.fromARGB(0, 14, 96, 131),
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
                    )
                  : //if Status is true
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Center(
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ))
        ])));
  }
}
