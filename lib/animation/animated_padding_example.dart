import 'package:flutter/material.dart';

class AnimatedPaddingExample extends StatefulWidget {
  static const routeName = '/animated-padding';

  @override
  _AnimatedPaddingExampleState createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  double paddingValue = 8.0;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedPadding'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedPadding(
              curve: Curves.easeIn,
              padding: EdgeInsets.all(paddingValue),
              child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                height: 150,
                width: 150,
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              duration: const Duration(milliseconds: 500),
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                "Update Padding",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => setState(() {
                selected = !selected;
                selected ? paddingValue = 30 : paddingValue = 8.0;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
