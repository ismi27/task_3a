import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_3a/crudsqflite/list_pegawai.dart';
import '4.listrumahsakit.dart';
import '6.profile+signout.dart';

class HomePage extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String email;

  HomePage(this.imageUrl, this.name, this.email);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/background2.jpg",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.transparent),
          elevation: 0,
          title: Row(
            children: [
              Spacer(),
              Image.asset(
                'assets/splashscreen.png',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                    child: Text(
                      "Welcome back!",
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Hello ${widget.name}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                                fit: FlexFit.tight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => HospitalList(
                                                name: widget.name,
                                                imageUrl: widget.imageUrl,
                                                email: widget.email)));
                                  },
                                  child: FeatureMenu(
                                    icon: Icons.list,
                                    title: "See Hospital",
                                    subtitle: "Hospital list",
                                  ),
                                )),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                      ListPegawai()
                                      ));
                                    },
                                    child: FeatureMenu(
                                      icon: Icons.perm_contact_calendar_rounded,
                                      title: "See Employee",
                                      subtitle: "Employee list",
                                    ),
                                  ))
                          ],
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile(
                                          widget.imageUrl,
                                          widget.name,
                                          widget.email)));
                            },
                            child: FeatureMenu(
                              icon: Icons.person_rounded,
                              title: "Profile",
                              subtitle: "See profile",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FeatureMenu extends StatelessWidget {
  final icon;
  final title;
  final subtitle;

  FeatureMenu({this.icon, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(-4, 4),
              blurRadius: 8.0,
              spreadRadius: 2,
              color: Colors.black.withOpacity(0.3))
        ], borderRadius: BorderRadius.circular(10), color: Colors.white70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple.withOpacity(0.8)),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 19, color: Colors.deepPurpleAccent),
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 15, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}
