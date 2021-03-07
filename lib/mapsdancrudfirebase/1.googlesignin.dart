import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '3.homescreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name;
  String email;
  String imageUrl;
  bool _obscureText = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleGoogleSign() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    UserCredential result = await _auth.signInWithCredential(credential);
    final User user = result.user;
    _alertDialog(user);
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;
  }

  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                "assets/background2.jpg",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.only(top: 40.0)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text("Log In",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54)),
                  ),
                  SizedBox(height: 35.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      "Login with Username/Email",
                      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Input Username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide:
                            BorderSide(width: 1.5, color: Colors.deepPurple)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Input Username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: _togglePasswordStatus,
                            color: Colors.deepPurple),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide:
                            BorderSide(width: 1.5, color: Colors.white24)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 10,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: FlatButton(
                      shape: StadiumBorder(),
                      color: Colors.deepPurple.withOpacity(0.8),
                      textColor: Colors.black,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () => _showToast(context),
                    ),
                  ),
                  SizedBox(height: 35),
                  Center(
                      child: Text("Or login with",
                          style:
                          TextStyle(fontSize: 18, color: Colors.deepPurple))),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white24,
                    border: Border.all(color: Colors.deepPurple)),
                    child: IconButton(
                      icon: Image.asset(
                        "assets/google.png",
                      ),
                      onPressed: () {
                        _handleGoogleSign();
                      },
                    ),
                  ),
                  Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum Punya Akun?',
                              style:
                              TextStyle(fontSize: 16.0, color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                            MaterialButton(
                              child: Text('Sign Up Now!',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  )),
                              onPressed: () => _showToast(context)
                            ),
                          ]))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _alertDialog(User user) {
    AlertDialog dialog = AlertDialog(
        backgroundColor: Colors.white.withOpacity(0.5),
        content: Container(
          height: 300.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline, size: 50.0, color: Colors.deepPurple,),
              Divider(),
              ClipOval(
                child: Image.network(user.photoURL),
              ),
              Divider(),
              Center(
                child: Text("Sign in with ${user.displayName} account success",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    child: Text("Next"),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomePage(imageUrl, name, email)
                    )),
                    color: Colors.deepPurple
                  ),
                ),
              )
            ],
          ),
        ));
    showDialog(context: context, child: dialog);
  }

  _showToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "This feature is currently under development",
        fontSize: 24,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black54,
    );
  }
}
