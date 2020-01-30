import 'package:flutter/material.dart';

class AnimatedBuilderExample extends StatefulWidget {
  static const routeName = '/animated-builder';

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder'),
      ),
      body: Center(
        child: Container(
          color: Colors.redAccent,
          height: 150.0,
          width: 150.0,
          child: AnimatedBuilder(
            animation: _animationController,
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.blueAccent,
            ),
            builder: (context, child) => Transform.rotate(
              angle: _animationController.value * 5.0,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
