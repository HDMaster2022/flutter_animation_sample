import 'package:flutter/material.dart';

class FadeTransitionExample extends StatefulWidget {
  static const routeName = '/fade-transition-example';

  @override
  _FadeTransitionExampleState createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;
  bool isAnimate = true;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FadeTransition'),
        ),
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    'Flutter',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                RaisedButton(
                  child: Text(
                    'Tap Me!',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (isAnimate) {
                      _animationController.reverse();
                    } else {
                      _animationController.forward();
                    }
                    setState(() {
                      isAnimate = !isAnimate;
                    });
                  },
                )
              ],
            ),
          ),
        ));
  }
}
