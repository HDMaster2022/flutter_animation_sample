import 'package:flutter/material.dart';

class SizeTransitionExample extends StatefulWidget {
  static const routeName = '/size-transition-example';

  @override
  _SizeTransitionExampleState createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  bool isAnimate = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animationController.forward();
    isAnimate = true;
    // TODO: implement initState
    super.initState();
  }

  void _animate() {
    if (isAnimate) {
      _animationController.reverse();
      isAnimate = false;
    } else {
      _animationController.forward();
      isAnimate = true;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SizeTransition'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizeTransition(
                sizeFactor: _animation,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000),
                      border: Border.all(
                        color: const Color(0xFF202020),
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      // No shadow.
                    ),
                    child: FlutterLogo(
                      size: 100.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text(
                  'Tap Me!',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                    _animate();
                  });
                },
              )
            ],
          ),
        ));
  }
}
