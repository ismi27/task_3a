import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'mapsdancrudfirebase/2.splashscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Task 3',
    home: SplashScreen(),
    theme: ThemeData(
      primaryColor: Color(0xff543B7A),
    ),
    debugShowCheckedModeBanner: false,
  ));
}


