import 'package:flutter/material.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  static const routeName = '/animated-crossfade';

  @override
  _AnimatedCrossFadeExampleState createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample>
    with SingleTickerProviderStateMixin {
  bool _first = false;
  bool _showText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedCrossFade'),),
      body: Center(
        child: Container(
          child: InkWell(
            onTap: () {
              setState(() {
                _first = !_first;
                _showText = !_showText;
              });
            },
            child: AnimatedCrossFade(
              firstCurve: Curves.easeInCubic,
              reverseDuration: const Duration(milliseconds: 2000),
              sizeCurve: Curves.bounceIn,
              duration: const Duration(milliseconds: 500),
              firstChild: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle),
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: AnimatedSize(
                  child: Text(
                    !_showText ? '' : 'Hello',
                    style: TextStyle(color: Colors.white),
                  ),
                  duration: Duration(milliseconds: 2000),
                  vsync: this,
                ),
              ),
              secondChild: Container(
                alignment: Alignment.center,
                color: Colors.pink,
                height: 100,
                width: 100,
                child: Text(
                  'Tap Me!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              crossFadeState:
                  _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
          ),
        ),
      ),
    );
  }
}
