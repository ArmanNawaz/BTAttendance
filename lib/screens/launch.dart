import 'package:eproxy/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        body: Container(
          child: TweenAnimationBuilder(
            onEnd: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const HomeScreen()));
            },
            curve: Curves.easeInToLinear,
            duration: const Duration(seconds: 1),
            tween: Tween(begin: 30.0, end: 50.0),
            builder: (context, value, child) => Center(
              child: Text(
                'BT Attendance',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: double.parse(value.toString()),
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
