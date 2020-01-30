import 'package:flutter/material.dart';

class ScaleAnimationExample extends StatefulWidget {
  static const routeName = '/scale-animation';

  @override
  _ScaleAnimationExampleState createState() => _ScaleAnimationExampleState();
}

class _ScaleAnimationExampleState extends State<ScaleAnimationExample>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInCirc);
    _controller.forward();

    // TODO: implement initState
    super.initState();
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
          title: Text('Scale Animation'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ScaleTransition(
            scale: _animation,
            alignment: Alignment.center,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
        ));
  }
}
