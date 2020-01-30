import 'package:flutter/material.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  static const routeName = '/animated-swicher';

  @override
  _AnimatedSwitcherExampleState createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcher'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedSwitcher(
                child: Container(
                  child: Text(
                    '$counter',
                    style: TextStyle(color: Colors.white),
                  ),
                  key: ValueKey<int>(counter),
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                ),
                duration: Duration(seconds: 1),
                transitionBuilder:
                    (Widget child, Animation<double> animation) =>
                        RotationTransition(
                  turns: animation,
                  child: child,
//                  scale: animation,
                ),
              ),
              RaisedButton(
                child: Text(
                  'Click!',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                    counter = counter + 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
