import 'dart:async';
import 'package:flutter/material.dart';
import 'isichat.dart';
import 'dart:convert';
import 'package:wethinks/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HalamanChat extends StatefulWidget {
  @override
  _HalamanChatState createState() => _HalamanChatState();
}

class _HalamanChatState extends State<HalamanChat> {
  Map list;
  List _list;
  String username;
  Timer timer;

  Future getdatalaravel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('user');
    });
    var data = {
      'username': username,
    };
    var response = await CallApi().postData(data, "coba");
    list = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        _list = list["listchat"];
      });
    }
  }

  @override
  void initState() {
    getdatalaravel();
    timer =
        Timer.periodic(Duration(seconds: 10), (Timer t) => getdatalaravel());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _list == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            body: _list == null
                ? Container()
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: list == null ? 0 : _list.length,
                    itemBuilder: (context, index) {
                      return IsiListChat(
                        username: username,
                        from: _list[index]["ke"],
                        list: _list,
                        nomer: index,
                      );
                    },
                  ),
          );
  }
}

class IsiListChat extends StatefulWidget {
  final String username;
  final String from;
  final List list;
  final int nomer;

  const IsiListChat({Key key, this.username, this.list, this.nomer, this.from})
      : super(key: key);
  @override
  _IsiListChatState createState() => _IsiListChatState();
}

class _IsiListChatState extends State<IsiListChat> {
  Map listchat, user;
  List _list, _isipesan, _count;
  String img;

  static String _url = "http://192.168.1.55/wethinks/public/Img/";

  void loadname() async {
    var data = {'email': widget.from};
    var response = await CallApi().postData(data, "loaduser");
    user = json.decode(response.body);
    setState(() {
      img = user["vendor"]["img"];
    });
  }

  Future getdatalaravel() async {
    var data = {'username': widget.username, 'from': widget.from};
    var response = await CallApi().postData(data, "coba2");
    listchat = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        _list = listchat["listchat"];
        _isipesan = listchat["pesan"];
        _count = listchat["count"];
      });
    }
  }

  @override
  void initState() {
    loadname();
    getdatalaravel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int j =
        _count == null ? 0 : _count.length == 0 ? 0 : _count[0]["isi_pesan"];
    return user == null
        ? Center(
            child: Container(),
          )
        : InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IsiChat(
                    username: widget.username,
                    from: widget.from,
                  ),
                ),
              );
            },
            onLongPress: () {},
            child: Container(
              padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
              child: Container(
                decoration: BoxDecoration(
                    // border: Border.all(width: 0.5, color: Colors.pink),
                    ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          _url + "vendor_image/" + img,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                        ),
                        Container(
                          height: 25,
                          width: MediaQuery.of(context).size.width - 100,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 169,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    widget.list[widget.nomer]["ke"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "09:20 AM",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          width: MediaQuery.of(context).size.width - 100,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 140,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _isipesan == null
                                        ? ""
                                        : _isipesan[0]["isi_pesan"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                                _count == null
                                    ? Container()
                                    : _count.length == 0
                                        ? Container()
                                        : Container(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                  left: 8.0,
                                                  right: 8.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Text(
                                                "$j",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
