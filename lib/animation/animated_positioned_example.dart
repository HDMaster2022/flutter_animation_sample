import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  static const routeName = '/animated-positioned';

  @override
  _AnimatedPositionedExampleState createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _isClick = false;
  double _left = 20;
  double _top = 20;
  double _right = 20;
  double _bottom = 20;

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedPositioned'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: deviceHeight / 2.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: AnimatedPositioned(
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      left: _left,
                      right: _right,
                      top: _top,
                      bottom: _bottom,
                      child: Container(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Tap Me!',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  _left = _isClick ? 10 : 20;
                  _right = _isClick ? 10 : 20;
                  _top = _isClick ? 70 : 20;
                  _bottom = _isClick ? 70 : 20;
                  _isClick = !_isClick;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
