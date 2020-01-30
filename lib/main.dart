import 'package:flutter/material.dart';
import 'package:flutter_animation_app/animation/animated_bottombar/bottombar_navigation_example.dart';
import 'package:flutter_animation_app/animation/animated_builder_example.dart';
import 'package:flutter_animation_app/animation/animated_crossfade.dart';
import 'package:flutter_animation_app/animation/animated_default_textstyle.dart';
import 'package:flutter_animation_app/animation/animated_list_example.dart';
import 'package:flutter_animation_app/animation/animated_opacity.dart';
import 'package:flutter_animation_app/animation/animated_padding_example.dart';
import 'package:flutter_animation_app/animation/animated_physicalmodel_example.dart';
import 'package:flutter_animation_app/animation/animated_positioned_example.dart';
import 'package:flutter_animation_app/animation/animated_switcher_example.dart';
import 'package:flutter_animation_app/animation/change_back_color_animation.dart';
import 'package:flutter_animation_app/animation/decoratedbox_transition_example.dart';
import 'package:flutter_animation_app/animation/fade_transition_example.dart';
import 'package:flutter_animation_app/animation/move_object_animation.dart';
import 'package:flutter_animation_app/animation/positioned_transition.dart';
import 'package:flutter_animation_app/animation/scale_animation.dart';
import 'package:flutter_animation_app/animation/sizetransition_example.dart';
import 'package:flutter_animation_app/animation/slidetransition_example.dart';
import 'package:flutter_animation_app/animation/transform_animation_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MoveObjectAnimation.routeName: (ctx) => MoveObjectAnimation(),
        PositionedTransitionExample.routeName: (ctx) =>
            PositionedTransitionExample(),
        AnimatedCrossFadeExample.routeName: (ctx) => AnimatedCrossFadeExample(),
        AnimatedOpacityExample.routeName: (ctx) => AnimatedOpacityExample(),
        AnimatedListExample.routeName: (ctx) => AnimatedListExample(),
        ScaleAnimationExample.routeName: (ctx) => ScaleAnimationExample(),
        ChangeBackColorAnimation.routeName: (ctx) => ChangeBackColorAnimation(),
        AnimatedPaddingExample.routeName: (ctx) => AnimatedPaddingExample(),
        AnimatedBuilderExample.routeName: (ctx) => AnimatedBuilderExample(),
        AnimatedDefaultTextStyleExample.routeName: (ctx) =>
            AnimatedDefaultTextStyleExample(),
        AnimatedPhysicalModelPage.routeName: (ctx) =>
            AnimatedPhysicalModelPage(),
        AnimatedPositionedExample.routeName: (ctx) =>
            AnimatedPositionedExample(),
        DecoratedBoxTransitionExample.routeName: (ctx) =>
            DecoratedBoxTransitionExample(),
        FadeTransitionExample.routeName: (ctx) => FadeTransitionExample(),
        SizeTransitionExample.routeName: (ctx) => SizeTransitionExample(),
        SlideTransitionExample.routeName: (ctx) => SlideTransitionExample(),
        TransformExample.routeName: (ctx) => TransformExample(),
        AnimatedSwitcherExample.routeName: (ctx) => AnimatedSwitcherExample(),
        BottomBarNavigationPatternExample.routeName: (ctx) =>
            BottomBarNavigationPatternExample(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var routes = [
    MoveObjectAnimation.routeName,
    PositionedTransitionExample.routeName,
    AnimatedCrossFadeExample.routeName,
    AnimatedOpacityExample.routeName,
    AnimatedListExample.routeName,
    ScaleAnimationExample.routeName,
    ChangeBackColorAnimation.routeName,
    AnimatedPaddingExample.routeName,
    AnimatedBuilderExample.routeName,
    AnimatedDefaultTextStyleExample.routeName,
    AnimatedPhysicalModelPage.routeName,
    AnimatedPositionedExample.routeName,
    DecoratedBoxTransitionExample.routeName,
    FadeTransitionExample.routeName,
    SizeTransitionExample.routeName,
    SlideTransitionExample.routeName,
    TransformExample.routeName,
    AnimatedSwitcherExample.routeName,
    BottomBarNavigationPatternExample.routeName,
  ];

  var routeName = [
    "Moving Animation",
    "PositionedTransition",
    "AnimatedCrossFade",
    "AnimatedOpacity",
    "AnimatedList",
    "ScaleAnimation",
    "Change Color",
    "AnimatedPadding",
    "AnimatedBuilder",
    "AnimatedDefaultTextStyle",
    "AnimatedPhysicalModel",
    "AnimatedPositioned",
    "DecoratedBoxTransition",
    "FadeTransition",
    "SizeTransition",
    "SlideTransition",
    "Transform",
    "AnimatedSwitcher",
    "Animated Bottombar",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            itemCount: routes.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(5.0),
                child: OutlineButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  borderSide: BorderSide(
                      color: Colors.primaries[index % Colors.primaries.length]),
                  child: Text(
                    routeName[index],
                    style: TextStyle(
                      color: Colors.primaries[index % Colors.primaries.length],
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(routes[index]);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
