import 'package:flutter/material.dart';
import 'package:flutter_animation_app/animation/animated_bottombar/animated_bottombar.dart';

class BottomBarNavigationPatternExample extends StatefulWidget {
  static const routeName = '/animated-bottombar';
  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: Icons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Likes",
      iconData: Icons.favorite_border,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: "Search",
      iconData: Icons.search,
      color: Colors.yellow.shade900,
    ),
    BarItem(
      text: "Profile",
      iconData: Icons.person_outline,
      color: Colors.teal,
    ),
  ];

  @override
  _BottomBarNavigationPatternExampleState createState() =>
      _BottomBarNavigationPatternExampleState();
}

class _BottomBarNavigationPatternExampleState
    extends State<BottomBarNavigationPatternExample> {
  int selectedBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: widget.barItems[selectedBar].color,
        duration: const Duration(milliseconds: 500),
      ),
      bottomNavigationBar: AnimatedBottomBar(
        barItems: widget.barItems,
        animationDuration: const Duration(
          milliseconds: 300,
        ),
        onBarTap: (index) {
          setState(() {
            selectedBar = index;
          });
        },
        barStyle: BarStyle(
            fontSize: 20.0, fontWeight: FontWeight.w400, iconSize: 24.0),
      ),
    );
  }
}
