import 'package:flutter/material.dart';
import 'package:wethinks/main.dart';
import 'login.dart';
import 'dart:convert';
import 'package:wethinks/api/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
//
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPages extends StatefulWidget {

  @override
  _RegisterPagesState createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email = "", _password = "";
  String _error = "";
  bool visible = true;
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                "REGISTER",
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
              onChanged: (value) {
                _password = value;
                setState(() {
                  _error = "";
                });
              },
              obscureText: secure,
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
                  _handleRegister();
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
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sudah Punya Akun? ",
                  style: TextStyle(fontFamily: "Poppins-Medium"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPages(),
                      ),
                    );
                  },
                  child: Text("Login",
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

  void _handleRegister() async {
    try {
      Map list;
      FirebaseUser user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      var data = {
        'uid': user.uid,
        'email': user.email,
        'password': _password,
      };
      var response = await CallApi().postData(data, "regisuser");
      var res = json.decode(response.body);
      print(res);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', user.email);
      data = {'email': prefs.getString('user')};
      response = await CallApi().postData(data, "cariuser");
      list = json.decode(response.body);
      prefs.setString('name', list["data"]["name"]);
      prefs.setString('telp', list["data"]["telp"]);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Layouts()));
    } catch (e) {
      setState(() {
        _error == "Given String is empty or null"
            ? _error = "Tolong isi Email dan Password"
            : _error = e.message;
      });
    }
  }
}
