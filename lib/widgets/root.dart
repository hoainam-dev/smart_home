import 'package:flutter/material.dart';
import 'package:workplace/screens/Home.dart';
import 'package:workplace/screens/Setting.dart';

class Root extends StatefulWidget {
  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  List<Light> lights = [
    Light(isOn: false),
    Light(isOn: false),
    Light(isOn: false),
    Light(isOn: false),
  ];

  int _currentIndex = 0;

  void toggleLight(int index) {
    setState(() {
      lights[index].isOn = !lights[index].isOn;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Home(),
      Settings(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.orange,
      ),
      home: Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}