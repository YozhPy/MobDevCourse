import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Animation",
      home: ShowAnimation(),
    );
  }
}

class ShowAnimation extends StatefulWidget {
  const ShowAnimation({Key? key}) : super(key: key);

  @override
  _ShowAnimationState createState() => _ShowAnimationState();
}

class _ShowAnimationState extends State<ShowAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _curveAnimation;

  late ColorTween _changeColorTween;
  late Tween<double> _changeSizeTween;
  late AlignmentTween _changeAlignmentTween;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _changeColorTween = ColorTween(begin: Colors.yellow, end: Colors.blue);
    _changeSizeTween = Tween<double>(begin: 100.0, end: 420.0);
    _changeAlignmentTween =
        AlignmentTween(begin: Alignment.bottomLeft, end: Alignment.bottomRight);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override 
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.black26,
                height: 150,
                width: _changeSizeTween.evaluate(_curveAnimation),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: _changeAlignmentTween.evaluate(_curveAnimation),
                child: Container(
                  width: 150,
                  color: Colors.amber,
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: _changeColorTween.evaluate(_curveAnimation),
                height: 50,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}
