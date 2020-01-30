import 'package:flutter/material.dart';

class ChangeBackColorAnimation extends StatefulWidget {
  static const routeName = 'change-color';

  @override
  _ChangeBackColorAnimationState createState() =>
      _ChangeBackColorAnimationState();
}

class _ChangeBackColorAnimationState extends State<ChangeBackColorAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _animation;

  void _changeColor() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);

    _animation = ColorTween(
            begin: Color.fromRGBO(230, 136, 218, 1.0),
            end: Color.fromRGBO(255, 178, 102, 1.0))
        .animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Color Animation'),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: _animation != null ? _animation.value : Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: RaisedButton(
                child: Text(
                  'Tap Me!',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
                onPressed: () {
                  _changeColor();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
