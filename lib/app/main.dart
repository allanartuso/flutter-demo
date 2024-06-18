import 'package:flutter/material.dart';
import 'router.dart';

class MainScreen extends StatefulWidget {
  final Widget screen;

  final tabs = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Setting',
    ),
  ];

  const MainScreen({super.key, required this.screen});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screen,
      bottomNavigationBar: BottomNavigationBar(
          items: widget.tabs,
          onTap: (index) {
            switch (index) {
              case 0:
                AppRouter.router.go(Routes.homeNamedPage);
                break;
              case 1:
                AppRouter.router.go(Routes.profileNamedPage);
                break;
              case 2:
                AppRouter.router.go(Routes.settingsNamedPage);
                break;
            }

            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex),
    );
  }
}
