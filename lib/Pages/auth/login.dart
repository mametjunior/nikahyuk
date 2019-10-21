import 'package:flutter/material.dart';
import 'package:wethinks/main.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:wethinks/api/api.dart';
import 'dart:convert';
//
import 'package:shared_preferences/shared_preferences.dart';


class LoginPages extends StatefulWidget {
  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String _email = "", _password = "";
  String _error = "";
  bool visible = true;
  bool secure = true;

  // Login Google
  void signInWithGoogle() async {
    Map list;
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    var data = {
      'uid': user.uid,
      'email': user.email,
      'name': user.displayName,
    };
    var response = await CallApi().postData(data, "regisuser");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user.email);
    data = {'email': prefs.getString('user')};
    response = await CallApi().postData(data, "cariuser");
    list = json.decode(response.body);
    prefs.setString('name', list["data"]["name"]);
    prefs.setString('telp', list["data"]["telp"]);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Layouts();
        },
      ),
    );
  }

  // Login Facebook
  FacebookLogin fblogin = new FacebookLogin();
  void initiateFacebookLogin() async {
    await fblogin.logIn(['email', 'public_profile']).then(
      (result) {
        switch (result.status) {
          case FacebookLoginStatus.error:
            print("Error");

            break;
          case FacebookLoginStatus.cancelledByUser:
            print("CancelledByUser");
            setState(() {
              _error = "Login Telah Dibatalkan";
            });
            break;
          case FacebookLoginStatus.loggedIn:
            print("LoggedIn");

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Layouts();
                },
              ),
            );
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "LOGIN",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            TextField(
              onChanged: (value) {
                _email = value;
                setState(() {
                  _error = "";
                });
              },
              decoration: InputDecoration(
                  hintText: "Please Input Username", labelText: "Username"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            TextField(
              obscureText: secure,
              onChanged: (value) {
                _password = value;
                setState(() {
                  _error = "";
                });
              },
              decoration: InputDecoration(
                hintText: "Please Input Password",
                labelText: "Password",
                hoverColor: Colors.teal,
                suffixIcon: IconButton(
                  icon: visible == true
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    visible == true
                        ? setState(() {
                            visible = false;
                            secure = false;
                          })
                        : setState(() {
                            visible = true;
                            secure = true;
                          });
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: _error == ""
                  ? Container()
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Center(
                        child: Text(
                          _error,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                onPressed: () {
                  hadlelogin();
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: (MediaQuery.of(context).size.width - 75) / 3,
                  child: Container(
                      height: 1,
                      alignment: Alignment.center,
                      color: Colors.black26.withOpacity(.2)),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 30) / 3,
                  child: Center(
                    child: Text("Atau Login Dengan"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: (MediaQuery.of(context).size.width - 75) / 3,
                  child: Container(
                      height: 1,
                      alignment: Alignment.center,
                      color: Colors.black26.withOpacity(.2)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    onPressed: () {
                      initiateFacebookLogin();
                    },
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black26.withOpacity(.2),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "F",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Text("Facebook"),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    onPressed: () {
                      signInWithGoogle();
                    },
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black26.withOpacity(.2),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.red[700],
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "G+",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Text("Google"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Pengguna Baru? ",
                  style: TextStyle(fontFamily: "Poppins-Medium"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPages(),
                      ),
                    );
                  },
                  child: Text("Register",
                      style: TextStyle(
                          backgroundColor: Colors.white,
                          color: Color(0xFF5d74e3),
                          fontFamily: "Poppins-Bold")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void hadlelogin() async {
    Map list;
    try {
      FirebaseUser user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', user.email);
      var data = {'email': prefs.getString('user')};
      var response = await CallApi().postData(data, "cariuser");
      list = json.decode(response.body);
      prefs.setString('name', list["data"]["name"]);
      prefs.setString('telp', list["data"]["telp"]);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Layouts(),
        ),
      );
    } catch (e) {
      setState(() {
        _error == "Given String is empty or null"
            ? _error = "Tolong isi Email dan Password"
            : _error = e.message;
      });
    }
  }
}
