import 'package:flutter/material.dart';

class ViewProject extends StatefulWidget {
  final int id;
  final int idvendor;
  final String nama;

  const ViewProject({Key key, this.id, this.idvendor, this.nama})
      : super(key: key);
  @override
  _ViewProjectState createState() => _ViewProjectState();
}

class _ViewProjectState extends State<ViewProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 1500,
                  color: Colors.lightGreen,
                ),
              ],
            ),
            Container(
              height: 500,
              color: Colors.lime,
            ),
            Text(widget.nama),
          ],
        ),
      ),
    );
  }
}
