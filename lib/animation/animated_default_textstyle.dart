import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleExample extends StatefulWidget {
  static const routeName = '/animated-default-textstyle';

  @override
  _AnimatedDefaultTextStyleExampleState createState() =>
      _AnimatedDefaultTextStyleExampleState();
}

class _AnimatedDefaultTextStyleExampleState
    extends State<AnimatedDefaultTextStyleExample> {
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedDefaultTextStyle'),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedDefaultTextStyle(
                curve: Curves.easeInOutBack,
                style: !isClick
                    ? TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)
                    : TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 30,
                        fontWeight: FontWeight.w300),
                duration: Duration(milliseconds: 500),
                child: Text('Hello Flutter'),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text(
                  'Tap Me!',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                    isClick = !isClick;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
