import 'package:flutter/material.dart';

class HalNotif extends StatefulWidget {
  @override
  _HalNotifState createState() => _HalNotifState();
}

class _HalNotifState extends State<HalNotif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFe8308c),
        title: Text("Notification"),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 0.2, color: Colors.black38.withOpacity(.5)))),
            child: Row(
              children: <Widget>[
                Container(

                  width: MediaQuery.of(context).size.width * 0.08,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.black38.withOpacity(.5),
                  ),
                ),
                Container(

                  width: (MediaQuery.of(context).size.width * 0.92) - 20 ,
                  child: ListTile(
                    title: (Text(
                        "Ini Adalah Contoh notif dengan system statics",maxLines: 3,)),
                    subtitle: Text("Oct 05, 2019"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
