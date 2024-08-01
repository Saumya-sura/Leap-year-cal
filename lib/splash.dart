import 'dart:async';
import 'package:flutter/material.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
 
    super.initState();
    startTimer();
  }
  startTimer()
  {
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }
  route()
  {
    Navigator.of(context).pushReplacementNamed("/signup");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }
  Widget content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Center(
          
          child: Text("Leap year or not ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
        )
      ],
    );
  }
}