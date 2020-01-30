import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  static const routeName = '/animated-opacity';

  @override
  _AnimatedOpacityExampleState createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedOpacity"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: Duration(seconds: 3),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  child: Text(
                    'Hello',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Tap Me!',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: _changeOpacity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
