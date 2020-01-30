import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class PositionedTransitionExample extends StatefulWidget {
  static const routeName = '/positioned-animation';

  @override
  _PositionedTransitionExampleState createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample> with TickerProviderStateMixin {
  final RelativeRectTween _relativeRectTween = RelativeRectTween(
    begin: RelativeRect.fromLTRB(0, 0, 200, 200),
    end: RelativeRect.fromLTRB(190, 200, 0, 0),
  );

  final RelativeRectTween _bottomRelativeRectTween = RelativeRectTween(
    begin: RelativeRect.fromLTRB(200, 200, 0, 0),
    end: RelativeRect.fromLTRB(0, 0, 190, 200),
  );

  AnimationController _topController, _bottomController;

  bool _top = true;
  bool _bottom = true;

  @override
  initState() {
    _topController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _bottomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  void dispose() {
    _topController.dispose();
    _bottomController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PositionedTransition'),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Container(
                margin: EdgeInsets.only(
                    top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Stack(
                  children: <Widget>[
                    PositionedTransition(
                      rect: _relativeRectTween.animate(_topController),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: RotationTransition(
                          turns: _topController,
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                if (!_top) {
                                  _topController.forward();
                                  _bottomController.forward();
                                } else {
                                  _topController.reverse();
                                  _bottomController.reverse();
                                }
                                _top = !_top;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                width: 150,
                                height: 150,
                                padding: EdgeInsets.all(20),
                                child: Text('Tap Me!'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    PositionedTransition(
                      rect: _bottomRelativeRectTween.animate(_bottomController),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: RotationTransition(
                          turns: _bottomController,
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                if (!_bottom) {
                                  _bottomController.forward();
                                  _topController.forward();
                                } else {
                                  _bottomController.reverse();
                                  _topController.reverse();
                                }
                                _bottom = !_bottom;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                width: 150,
                                height: 150,
                                padding: EdgeInsets.all(20),
                                child: Text('Tap Me!'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
