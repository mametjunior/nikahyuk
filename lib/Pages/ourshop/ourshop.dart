import 'package:flutter/material.dart';

class OurShop extends StatefulWidget {
  @override
  _OurShopState createState() => _OurShopState();
}

class _OurShopState extends State<OurShop> {
  static Color warna = Color(0xFFe8308c);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "COMING SOON",
        style: TextStyle(
          color: warna,
          fontSize: 38,
          fontWeight: FontWeight.w800
        ),
      ),
    );
  }
}
