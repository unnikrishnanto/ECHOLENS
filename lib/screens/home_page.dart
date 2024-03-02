import 'package:flutter/material.dart';
import 'package:main_project/screens/home_screen.dart';
import 'package:main_project/screens/profile_page.dart';
import 'package:main_project/screens/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;

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
        body: [const SettingsPage(), const HomeScreen(),const ProfilePage()][currentIndex],
        
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          indicatorColor:  Colors.transparent,
          selectedIndex: currentIndex,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (index) {
            
            setState(() {
              currentIndex = index;  
            });
          },
          destinations: [
            NavigationDestination(
                icon: Image.asset('assets\\icons\\googles_image.png',width: 80,),
                label: "\n\n\n\n "),
            NavigationDestination(
                icon: Image.asset('assets\\icons\\googles_image.png',width: 80,),
                label: "\n\n\n\n"),
            NavigationDestination(
                icon: Image.asset('assets\\icons\\googles_image.png',width: 80,),
                label: "\n\n\n\n"),
          ],
        ));
  }
}
