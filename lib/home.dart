import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'placeholder_widget.dart';

class Home extends StatefulWidget {
  static String tag = 'home-page';

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.purple)
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RateSkill'),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: _children[_currentIndex], // new

      bottomNavigationBar: BottomNavyBar(
        currentIndex: _currentIndex,

        onItemSelected: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            inactiveColor:  Colors.grey,
            activeColor: Colors.lightBlueAccent,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Staff'),
              inactiveColor:  Colors.grey,
              activeColor: Colors.lightBlueAccent
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.face),
              title: Text('Profile'),
              inactiveColor:  Colors.grey,
              activeColor: Colors.lightBlueAccent
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              inactiveColor:  Colors.grey,
              activeColor: Colors.lightBlueAccent
          ),

        ],
      ),

    );
  }
}