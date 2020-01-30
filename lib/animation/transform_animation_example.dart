import 'dart:math' as math;

import 'package:flutter/material.dart';

class TransformExample extends StatefulWidget {
  static const routeName = '/transform-example';

  @override
  _TransformExampleState createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 20, left: 20.0),
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    /*   Container(
              color: Colors.black,
              child: Transform(
                transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: const Color(0xFFE8581C),
                  child: const Text('Transform!'),
                ),
              ),
            ),*/
                    Slider(
                      min: 0.0,
                      max: MediaQuery.of(context).size.width,
                      value: sliderValue,
                      onChanged: (newValue) {
                        setState(() {
                          sliderValue = newValue;
                        });
                      },
                    ),
                    Transform.rotate(
                      angle: sliderValue * math.pi / 180.0,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.redAccent,
                        height: 100,
                        width: 100,
                        child: Text(
                          'Rotate',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Transform.scale(
                      scale: sliderValue / MediaQuery.of(context).size.width,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.blueAccent,
                        height: 100,
                        width: 100,
                        child: Text(
                          'Scale',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(sliderValue, 0.0),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.green,
                            height: 100,
                            width: 100,
                            child: Text(
                              'Translate',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Slider(
                      min: 0.0,
                      max: MediaQuery.of(context).size.width,
                      value: sliderValue,
                      onChanged: (newValue) {
                        setState(() {
                          sliderValue = newValue;
                        });
                      },
                    ),
                    Transform.rotate(
                      angle: sliderValue * math.pi / 180.0,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.redAccent,
                        height: 100,
                        width: 100,
                        child: Text(
                          'Rotate',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Transform.scale(
                      scale: sliderValue / MediaQuery.of(context).size.width,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.blueAccent,
                        height: 100,
                        width: 100,
                        child: Text(
                          'Scale',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0.0, sliderValue / 5.0),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.green,
                            height: 100,
                            width: 100,
                            child: Text(
                              'Translate',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          )),
    );
  }
}

class ExampleTwo extends StatefulWidget {
  static const routeName = '/transform-trexample-two';

  @override
  _ExampleTwoState createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return new Transform(
          transform: Matrix4.identity()
            ..setEntry(1, 2, 0.001)
            ..rotateZ(animationController.value),
          child: child,
        );
      },
      child: new Scaffold(
        appBar: AppBar(
          title: Text("The 3D Matrix"),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: () => animationController.repeat(),
            child: new Text("Click Me!"),
          ),
        ),
      ),
    );
  }
}
