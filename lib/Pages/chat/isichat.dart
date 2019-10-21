import 'package:flutter/material.dart';
import 'package:wethinks/api/api.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:async';

class IsiChat extends StatefulWidget {
  final String username;
  final String from;

  const IsiChat({Key key, this.username, this.from}) : super(key: key);
  @override
  _IsiChatState createState() => _IsiChatState();
}

class _IsiChatState extends State<IsiChat> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Map list, user;
  List _list;
  IconData loadicon = Icons.mic;
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  Timer timer;
  String email;

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      var data = {
        'dari': widget.username,
        'ke': widget.from,
        'tanggal': DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
        'isi_pesan': messageController.text,
        'status': "sent",
      };
      var response = await CallApi().postData(data, "inputmessage");
      list = json.decode(response.body);
      messageController.clear();

      return getdatalaravel();
    }
  }

  void loadname() async {
    var data = {'email': widget.from};
    var response = await CallApi().postData(data, "loaduser");
    user = json.decode(response.body);
    setState(() {
      email = user["vendor"]["nama"];
    });
  }

  Future getdatalaravel() async {
    var data = {'from': widget.from, 'username': widget.username};
    var response = await CallApi().postData(data, "isichat");
    list = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        _list = list["pesan"];
      });
    }
  }

  @override
  void initState() {
    loadname();
    getdatalaravel();
    timer =
        Timer.periodic(Duration(seconds: 10), (Timer t) => getdatalaravel());
    super.initState();
  }

  @override
  void dispose() {
    getdatalaravel();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Color(0xFFe8308c),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context, false);
                },
                child: Icon(Icons.arrow_back_ios),
              ),
              title: Center(
                child: Text(email),
              ),
              actions: <Widget>[
                InkWell(
                  child: Icon(Icons.delete),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                ),
              ],
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _list == null ? 0 : _list.length,
                      itemBuilder: (context, index) {
                        return Message(
                          from: _list[index]["dari"],
                          text: _list[index]['isi_pesan'],
                          me: widget.username == _list[index]["dari"],
                        );
                      },
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (value) => value == ""
                                ? loadicon = Icons.mic
                                : loadicon = Icons.send,
                            onSubmitted: (value) => callback(),
                            decoration: InputDecoration(
                              hintText: "Enter a Message...",
                              border: const OutlineInputBorder(),
                              suffixIcon: InkWell(
                                onTap: () {
                                  callback();
                                },
                                child: Icon(loadicon),
                              ),
                            ),
                            controller: messageController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SendButton({Key key, this.text, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: callback,
        child: Icon(
          Icons.send,
          size: 35,
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String from;
  final String text;
  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
            me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
          ),
          Material(
            color: me ? Colors.teal : Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
              ),
            ),
          )
        ],
      ),
    );
  }
}
