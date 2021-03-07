import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '1.googlesignin.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ), child: Text("Sedang loading"));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return LoginPage();
        }
        return Container(height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),child: Text("Sedang loading"));
      },
    );
  }
}