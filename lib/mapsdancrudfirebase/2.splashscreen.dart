import 'dart:async';
import 'package:flutter/material.dart';
import 'firebase.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async{
    var duration = const Duration(seconds:5);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (_){
                return App();
              }
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/splashscreen.png',
                fit: BoxFit.fill,
              ),
              Text(
                  "Udacoding Hospital",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.purple
                  )
              )
            ],
          ),
        ));
  }
}