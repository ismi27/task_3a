import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '1.googlesignin.dart';
import '3.homescreen.dart';

class Profile extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String email;

  Profile(this.imageUrl, this.name, this.email);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> _signOut() async {
    await _googleSignIn.signOut();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => LoginPage()
    ));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/wallpaper.jpg",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          title: Row(
            children: [
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                              widget.imageUrl, widget.name, widget.email)));
                },
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 700,
              width: 600,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Center(
                    child: Text("My Profile",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54)),
                  ),
                  Divider(),
                  Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.imageUrl,
                      ),
                      radius: 60,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 30, bottom: 5),
                    child: Text("USER NAME",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      height: 50,
                      width: 400,
                      margin: EdgeInsets.only(left: 25, right: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Text(widget.email,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      )),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 30, bottom: 5),
                    child: Text("EMAIL ID",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      height: 50,
                      width: 400,
                      margin: EdgeInsets.only(left: 25, right: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(widget.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      )),
                  Divider(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
//                      color: Colors.transparent.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: RaisedButton(
                          shape: StadiumBorder(),
                          color: Colors.white70,
                          child: Text("Log Out",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        onPressed: () {
                            _signOut();
                        }
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
