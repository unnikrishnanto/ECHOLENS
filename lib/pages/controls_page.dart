import 'package:flutter/material.dart';

class ControlsPage extends StatelessWidget {
  const ControlsPage ({super.key});

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
      body:const ControlsBody(),
    )
    ;}
}

class ControlsBody extends StatelessWidget {
  const ControlsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Controls page');
  }
}