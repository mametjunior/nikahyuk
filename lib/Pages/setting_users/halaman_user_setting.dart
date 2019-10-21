import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:wethinks/UI/kinarian-icon/kinarian_icons.dart';
import 'account_setting.dart';
//
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wethinks/UI/slidepageroute/slide.dart';
import 'package:wethinks/main.dart';

class HalamanUserSetting extends StatefulWidget {
  @override
  _HalamanUserSettingState createState() => _HalamanUserSettingState();
}

class _HalamanUserSettingState extends State<HalamanUserSetting> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookLogin fblogin = new FacebookLogin();
  String nama, email, telp;

  Future getdatalaravel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString("name");
      email = prefs.getString("user");
      telp = prefs.getString("telp");
    });
  }

  @override
  void initState() {
    getdatalaravel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 140,
        color: Colors.grey[300],
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.pink[200],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 35.0),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                          "http://192.168.1.55/wethinks/public/img/photo_profile/1.jpg"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    child: Text(
                      nama == null ? "" : nama,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            Column(
              children: <Widget>[
                ButtonLink(
                  icon: Kinarian.profile,
                  text: "Account Setting",
                  callback: () {Navigator.push(context, SlideLeftRoute(page: AccountSet()));},
                ),
                ButtonLink(
                  icon: Kinarian.notification,
                  text: "Notification Setting",
                  callback: () {},
                ),
                ButtonLink(
                  icon: Kinarian.profile,
                  text: "Help",
                  callback: () {},
                ),
                ButtonLink(
                  icon: Kinarian.profile,
                  text: "About",
                  callback: () {},
                ),
                ButtonLink(
                  icon: Kinarian.profile,
                  text: "Term & Condition",
                  callback: () {},
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            InkWell(
              onTap: () {
                googleSignIn.signOut();
                fblogin.logOut();
                cleardata();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Layouts()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.power_settings_new),
                    ),
                    Container(
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
          ],
        ),
      ),
    );
  }

  void cleardata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

class ButtonLink extends StatelessWidget {
  final VoidCallback callback;
  final IconData icon;
  final String text;

  const ButtonLink({Key key, this.callback, this.icon, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.grey[300]))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      icon,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
