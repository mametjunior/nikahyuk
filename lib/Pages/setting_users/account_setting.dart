import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wethinks/Pages/setting_users/halaman_user_setting.dart';
import 'package:wethinks/api/api.dart';

import '../../main.dart';

class AccountSet extends StatefulWidget {
  @override
  _AccountSetState createState() => _AccountSetState();
}

class _AccountSetState extends State<AccountSet> {
  TextEditingController namaC = new TextEditingController();
  TextEditingController emailC = new TextEditingController();
  TextEditingController telpC = new TextEditingController();

  Future loaddata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namaC.text = prefs.getString('name');
      emailC.text = prefs.getString('user');
      telpC.text = prefs.getString('telp');
    });
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFe8308c),
        automaticallyImplyLeading: true,
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: FlatButton(
            onPressed: () {
              _handleupdate();
            },
            color: Color(0xFFe8308c),
            child: Text(
              "Update Data Profile",
              style: TextStyle(color: Colors.white),
            )),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              controller: namaC,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.blue,
                hintText: "Ubah nama lengkap",
                labelText: "Nama Lengkap",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              readOnly: true,
              controller: emailC,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.blue,
                hintText: "Ubah Email",
                labelText: "Email",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              controller: telpC,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.blue,
                hintText: "Ubah nomer telpon",
                labelText: "Nomer Telpon",
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleupdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'email': emailC.text,
      'nama': namaC.text,
      'telp': telpC.text,
    };
    var response = await CallApi().postData(data, "updateuser");
    var list = json.decode(response.body);
    if (list["succes"]) {
      setState(() {
        prefs.setString('name', namaC.text);
        prefs.setString('telp', telpC.text);
      });
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Layouts(
                  laman: HalamanUserSetting(),
                )));
  }
}
