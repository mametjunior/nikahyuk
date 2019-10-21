import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wethinks/Pages/shopping_cart/checkout.dart';
import 'package:wethinks/UI/slidepageroute/slide.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    name: "Rp. ",
  );
  final String _url = 'http://192.168.1.55/wethinks/public/';
  var list = [];
  int harga = 5000000;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFe8308c),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, false);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 1,
                childAspectRatio: 2,
                shrinkWrap: true,
                children: List.generate(
                  4,
                  (i) {
                    var harga2 = (i + 1) * harga;
                    list.addAll({harga2});
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 2.5),
                      // color: Colors.tealAccent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38.withOpacity(.2),
                                offset: Offset(0, 2),
                                spreadRadius: 2,
                                blurRadius: 2)
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height - 630,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  child: Image.network(
                                    _url + "vendor_image/aza.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      height: 30,
                                      width: 175,
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Nama",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                          color: Color(0xFFe8308c),
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      height: 60,
                                      width: 175,
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Kategori",
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      height: 20,
                                      width: 175,
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "${formatCurrency.format(harga2)}",
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38.withOpacity(.2),
                                        spreadRadius: 1,
                                        blurRadius: 0)
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          width: 1,
                                          color: Colors.black38.withOpacity(.4),
                                        ),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    child: Text("REMOVE"),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    decoration: BoxDecoration(),
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    child: Text("MOVE TO WISHLIST"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38.withOpacity(.2),
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                      blurRadius: 2)
                ],
              ),
              height: 70,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 150,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 20,
                          width: 150,
                          child: Text(
                            "Total :",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.5),
                        ),
                        Container(
                          height: 20,
                          width: 150,
                          child: Text(
                            '${formatCurrency.format(total)}',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    child: FlatButton(
                      color: Color(0xFFe8308c),
                      onPressed: () {
                        Navigator.push(
                            context,
                            SlideTopRoute(
                                page: CheckOut(
                              total: total,
                            )));
                      },
                      child: Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
