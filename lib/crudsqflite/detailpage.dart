import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageDetail extends StatelessWidget {
  String pertama, terakhir, email, phone, position, division;

  PageDetail({this.pertama, this.terakhir, this.email, this.phone, this.position, this.division});

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
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Divider(),
                Center(
                  child: Text("Detail Employee",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54)),
                ),
                Divider(),
                Container(
                  height: 400,
                  margin: EdgeInsets.only(left: 70, right: 70),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 30,
                            left: -50,
                            child: Container(
                                height: 180,
                                width: 250,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepPurple.withOpacity(
                                        0.5)
                                    ))),
                        Positioned(
                            left: 30,
                            top: -50,
                            child: Container(
                                height: 250,
                                width: 280,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.purple.withOpacity(0.5)))),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                                height: 500,
                                width: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.black.withOpacity(0.5)))),
                        Positioned(
                          right: 10,
                          left: 20,
                          top: 210,
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$pertama $terakhir',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Phone: $phone'),
                                Text('Email: $email'),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          left: 20,
                          top: 280, //main content container postition.
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('$division', style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text('$position', style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic)),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 50,
                          top: 10,
                          child: Container(
                              height: 250,
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('assets/iconlauncher.png'),
                                ],
                              )),
                        ),
                        Positioned(
                            top: 70,
                            left: 20,
                            height: 120,
                            width: 120,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white70,width: 5)
                              ),
                              child: CircleAvatar(
                                  foregroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage('assets/photo.jpg')),
                            )),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
