import 'dart:async';

import 'package:eproxy/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 1),
        () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>const HomeScreen()))
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        body: Container(
          child: const Center(
            child: Text(
              'BT Attendance',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 38.0,
              color: Colors.white
            ),
            ),
          ),
        ),
      ),
    );
  }
}
