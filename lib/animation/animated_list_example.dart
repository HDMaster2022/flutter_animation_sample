import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  static const routeName = '/animaed-list';

  @override
  _AnimatedListExampleState createState() => _AnimatedListExampleState();
}

var randomNumbers = new Random();

class _AnimatedListExampleState extends State<AnimatedListExample>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  var _data = new List.generate(10, (_) => randomNumbers.nextInt(100));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Animated List'),
        backgroundColor: Colors.blueAccent,
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          color: Colors.blue,
          child: Text(
            'Add an item',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            _addAnItem();
          },
        ),
        RaisedButton(
          color: Colors.blue,
          child: Text(
            'Remove last item',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            _removeLastItem();
          },
        ),
        RaisedButton(
          color: Colors.blue,
          child: Text(
            'Remove all item',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            _removeAllItems();
          },
        ),
      ],
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _data.length,
        itemBuilder: (context, index, animation) =>
            _buildItem(context, _data[index], animation),
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, int item, Animation<double> animation) {
    TextStyle textStyle = new TextStyle(fontSize: 20);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: SizedBox(
          height: 50.0,
          child: Card(
            child: Center(
              child: Text(item.toString(), style: textStyle),
            ),
          ),
        ),
      ),
    );
  }

  void _addAnItem() {
    _data.insert(0, randomNumbers.nextInt(50));
    _listKey.currentState.insertItem(0, duration: Duration(milliseconds: 1000));
  }

  void _removeLastItem() {
    int itemToRemove = _data[0];

    _listKey.currentState.removeItem(
      0,
      (BuildContext context, Animation<double> animation) =>
          _buildItem(context, itemToRemove, animation),
      duration: const Duration(milliseconds: 1000),
    );
    _data.removeAt(0);
  }

  void _removeAllItems() {
    final int itemCount = _data.length;

    for (var i = 0; i < itemCount; i++) {
      int itemToRemove = _data[0];
      _listKey.currentState.removeItem(
        0,
        (BuildContext context, Animation<double> animation) =>
            _buildItem(context, itemToRemove, animation),
        duration: const Duration(milliseconds: 1000),
      );
      _data.removeAt(0);
    }
  }
}
