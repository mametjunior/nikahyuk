import 'package:flutter/material.dart';
import 'package:wethinks/Pages/Vendors/projectview.dart';
import 'package:wethinks/Pages/searchitem/pluginsearch.dart';
import 'package:wethinks/Pages/searchitem/searchdata.dart';
import 'package:wethinks/UI/slidepageroute/slide.dart';
import 'dart:convert';
import 'package:wethinks/api/api.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wethinks/UI/kinarian-icon/kinarian_icons.dart';
import 'package:wethinks/Pages/chat/isichat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailVendors extends StatefulWidget {
  final int index;
  final int id;
  final String img;
  const DetailVendors({Key key, this.index, this.id, this.img})
      : super(key: key);
  @override
  _DetailVendorsState createState() => _DetailVendorsState();
}

class _DetailVendorsState extends State<DetailVendors> {
  final String _url = 'http://192.168.1.55/wethinks/public/Img/vendor_image/';
  Map dataketegory;
  List listport;
  String nama, deskripsi, portofolio, user, kategori, kota, email;
  int harga;
  Future getdatalaravel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = widget.id;
    var response = await CallApi().infoData(data, "detailVendor");
    dataketegory = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        user = prefs.getString('user');
        nama = dataketegory["datavendor"]["nama"];
        email = dataketegory["datavendor"]["email"];
        deskripsi = dataketegory["datavendor"]["deskripsi"];
        portofolio = dataketegory["datavendor"]["portofolio"];
        kategori = dataketegory["datavendor"]["kategory"];
        kota = dataketegory["datavendor"]["kota"];
        listport = dataketegory["project"];
      });
    }
  }

  @override
  void initState() {
    getdatalaravel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var j = widget.index;
    return Scaffold(
      body: new CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          new SliverAppBar(
            shape:
                Border(bottom: BorderSide(width: 1.0, color: Colors.black26)),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context, false);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFe8308c),
              ),
            ),
            title: TextField(
              readOnly: true,
              onTap: () => showCari(
                context: context,
                delegate: TextSearch(),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: InkWell(
                  onTap: () => showCari(
                    context: context,
                    delegate: TextSearch(),
                  ),
                  child: Icon(
                    Icons.search,
                    color: Color(0xFFe8308c),
                  ),
                ),
              ),
            ),
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
                centerTitle: true,
                background: Hero(
                  tag: "vendorimage$j",
                  child: Image.network(
                    _url + widget.img,
                    fit: BoxFit.fitHeight,
                  ),
                )),
          ),
          new SliverToBoxAdapter(
            child: dataketegory == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 20,
                              child: RatingBar(
                                initialRating: 3,
                                itemSize: 15,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0.5),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                ignoreGestures: true,
                                onRatingUpdate: (rating) {},
                              ),
                            ),
                            Text(
                              "160 Ulasan",
                              style: TextStyle(color: Colors.grey[400]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          nama,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 10, left: 5, right: 5),
                        child: Text(
                          kategori + ' - ' + kota,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.grey[300]),
                            bottom:
                                BorderSide(width: 1, color: Colors.grey[300]),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButtonTop(
                              icon: Icons.phone_iphone,
                              text: "Call",
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      width: 2,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButtonTop(
                              icon: Kinarian.speech_bubble,
                              text: "Message",
                              callback: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IsiChat(
                                      username: user,
                                      from: email,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      width: 2,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButtonTop(
                              icon: Kinarian.coin,
                              text: "Price List",
                              callback: () {
                                Navigator.push(
                                  context,
                                  SlideLeftRoute(page: ViewProject()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: Container(
                          height: 15,
                          color: Colors.grey[200],
                        ),
                      ),
                      Projectfortofolio(
                        listport: listport,
                        id: widget.id,
                        nama: nama,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: Container(
                          height: 15,
                          color: Colors.grey[200],
                        ),
                      ),
                      SosmedChild(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: Container(
                          height: 15,
                          color: Colors.grey[200],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 2, color: Colors.grey[500]))),
                              child: Text(
                                "Deskripsi",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                deskripsi,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: Container(
                          height: 15,
                          color: Colors.grey[200],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          color: Color(0xFFe8308c),
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text("Tulis Ulasan"),
                        ),
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

//
//

class SosmedChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey[300],
          ),
          bottom: BorderSide(width: 1, color: Colors.grey[300]),
        ),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Social Media",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey[500]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 40,
                    height: 40,
                    child: Icon(Kinarian.facebook, color: Colors.grey[500])),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey[500]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 40,
                    height: 40,
                    child: Icon(Kinarian.instagram, color: Colors.grey[500])),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey[500]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 40,
                    height: 40,
                    child: Icon(Kinarian.twitter, color: Colors.grey[500])),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//
//
//
class IconButtonTop extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback callback;

  const IconButtonTop({Key key, this.icon, this.text, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 3 - 15,
      height: 60,
      child: ListTile(
        onTap: callback,
        title: Icon(
          icon,
          size: 40,
          color: Colors.grey[400],
        ),
        subtitle: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[400]),
        ),
      ),
    );
  }
}

//
//
class Projectfortofolio extends StatefulWidget {
  final List listport;
  final String nama;
  final int id;
  const Projectfortofolio({Key key, this.listport, this.nama, this.id})
      : super(key: key);

  @override
  _ProjectfortofolioState createState() => _ProjectfortofolioState();
}

class _ProjectfortofolioState extends State<Projectfortofolio> {
  final String _url =
      'http://192.168.1.55/wethinks/public/Img/portofolio_image/';

  @override
  Widget build(BuildContext context) {
    List list = widget.listport;
    var j = list.length;
    return list == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Portofolio",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(right: 5),
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(color: Color(0xFFe8308c)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                decoration: BoxDecoration(
                                    color: Color(0xFFe8308c),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "$j",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 3),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFFe8308c),
                                    size: 12,
                                  )),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 322,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      return LoadProject(
                        project: list[i]["nama_project"],
                        id: widget.id,
                        index: i,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}

class LoadProject extends StatefulWidget {
  final String project;
  final int id;
  final int index;
  const LoadProject({Key key, this.project, this.id, this.index})
      : super(key: key);
  @override
  _LoadProjectState createState() => _LoadProjectState();
}

class _LoadProjectState extends State<LoadProject> {
  Map datapro;
  List listpro = [];
  String image;
  static String _url = 'http://192.168.1.55/wethinks/public/Img/project_image/';

  Future loadProject() async {
    var data = {'id_vendor': widget.id, 'nama': widget.project};
    var res = await CallApi().postData(data, "loadproject");
    datapro = json.decode(res.body);
    setState(() {
      image = datapro["dataproject"]["foto"];
      listpro = image.split(',').toList();
    });
  }

  @override
  void initState() {
    loadProject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return datapro == null
        ? Container()
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey[300])),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200,
                      child: Image.network(
                        _url + listpro[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 250,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.project,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                          ),
                          Text(
                            datapro["dataproject"]["deskripsi"],
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                          ),
                          Text(
                            DateFormat("dd-MMM yy").format(DateTime.parse(
                                datapro["dataproject"]["tanggal"])),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
