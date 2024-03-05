import 'package:flutter/material.dart';
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

class ControlsBody extends StatelessWidget {
  const ControlsBody({
    super.key,
  });

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
              Container(
                color: Color.fromARGB(255, 200, 196, 184),
                width: 100,
                height: 100,
              ),
              Container(
                color: Color.fromARGB(255, 200, 196, 184),
                width: 100,
                height: 100,
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
                color: Color.fromARGB(255, 200, 196, 184),
                width: 100,
                height: 100,
              ),
              Container(
                color: Color.fromARGB(255, 200, 196, 184),
                width: 100,
                height: 100,
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
            child:  CircleAvatar(
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
