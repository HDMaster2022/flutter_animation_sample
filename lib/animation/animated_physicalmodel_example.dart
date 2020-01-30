import 'package:flutter/material.dart';

class AnimatedPhysicalModelPage extends StatefulWidget {
  static const routeName = '/animated-PhysicalModel';

  @override
  _AnimatedPhysicalModelPageState createState() =>
      _AnimatedPhysicalModelPageState();
}

class _AnimatedPhysicalModelPageState extends State<AnimatedPhysicalModelPage>
    with SingleTickerProviderStateMixin {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedPhysicalModel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              elevation: _first ? 0 : 8.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: _first
                  ? const BorderRadius.all(Radius.circular(0))
                  : const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: const Text(
                'Tap Me!',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  _first = !_first;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
