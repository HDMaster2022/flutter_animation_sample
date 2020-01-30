import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;
  final BarStyle barStyle;

  AnimatedBottomBar({
    this.barItems,
    this.animationDuration = const Duration(
      milliseconds: 500,
    ),
    this.onBarTap,
    this.barStyle,
  });

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20.0,
          top: 16.0,
          left: 8.0,
          right: 8.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedIndex == i;
      _barItems.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              selectedIndex = i;
              widget.onBarTap(selectedIndex);
            });
          },
          child: AnimatedContainer(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            duration: widget.animationDuration,
            decoration: BoxDecoration(
                color: isSelected
                    ? item.color.withOpacity(0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              children: <Widget>[
                Icon(
                  item.iconData,
                  color: isSelected ? item.color : Colors.black,
                  size: widget.barStyle.iconSize,
                ),
                SizedBox(
                  width: 10.0,
                ),
                AnimatedSize(
                  duration: widget.animationDuration,
                  vsync: this,
                  child: Text(
                    isSelected ? item.text : "",
                    style: TextStyle(
                        color: item.color,
                        fontWeight: widget.barStyle.fontWeight,
                        fontSize: widget.barStyle.fontSize),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return _barItems;
  }
}

class BarItem {
  String text;
  IconData iconData;
  Color color;

  BarItem({this.text, this.iconData, this.color});
}

class BarStyle {
  final double fontSize, iconSize;
  final FontWeight fontWeight;

  BarStyle(
      {this.fontSize = 18.0,
      this.iconSize = 32.0,
      this.fontWeight = FontWeight.w600});
}
