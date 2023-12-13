import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late bool isFavorite;
  late Animation<double?> sequence;
  late Animation<Color?> color;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    isFavorite = false;
    sequence = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 20.0, end: 200.0), weight: 3),
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 20.0), weight: 3),
      TweenSequenceItem(tween: Tween(begin: 20.0, end: 200.0), weight: 3),
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 20.0), weight: 3),
    ]).animate(controller);
    color =
        ColorTween(begin: Colors.red, end: Colors.black).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        builder: (context, _) {
          return Center(
            child: IconButton(
              iconSize: sequence.value,
              onPressed: () {
                if (!isFavorite) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
                isFavorite = !isFavorite;
              },
              icon: Icon(
                Icons.favorite,
                color: color.value,
              ),
            ),
          );
        },
        animation: controller,
      ),
    );
  }
}
