import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckOut extends StatefulWidget {
  final int total;

  const CheckOut({Key key, this.total}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final formatCurrency = new NumberFormat.simpleCurrency(
    name: "Rp. ",
  );
  static Color warna = Color(0xFFe8308c);
  String invoice;

  Future noinvoice() async {
    var tanggal = DateFormat("yyMMddhhmmss").format(DateTime.now());
    if (this.mounted) {
      setState(() {
        invoice = "NKI" + tanggal;
      });
    }
  }

  @override
  void initState() {
    noinvoice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: warna,
      ),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          color: warna,
          child: Center(
            child: Text(
              "BOOKING",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      body: Container(
        color: warna.withOpacity(.4),
        height: MediaQuery.of(context).size.height - 120,
        child: Center(
          child: Container(
            height: 200,
            width: 320,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(bottom: 10),
                  height: 50,
                  child: Center(
                    child: Text(
                      "INVOICE",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 2, color: warna))),
                ),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "No Invoice",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.black38.withOpacity(.4),
                        ),
                      ),
                      Text(
                        invoice,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.black38.withOpacity(.4),
                        ),
                      ),
                      Text(
                        '${formatCurrency.format(widget.total)}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
