import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'searchitem/searchdata.dart';
// import 'package:wethinks/UI/kinarian-icon/kinarian_icons.dart';
import 'searchitem/pluginsearch.dart';
import 'package:wethinks/api/api.dart';

class HalamanDepan extends StatefulWidget {
  final String username;

  const HalamanDepan({Key key, this.username}) : super(key: key);

  @override
  _HalamanDepanState createState() => _HalamanDepanState();
}

class _HalamanDepanState extends State<HalamanDepan> {
  static String url = "http://192.168.1.55/wethinks/public/Img/iklan_image/";
  Map dataiklan;
  List iklanData;
  List vendorData;
  int index = 1;

  Future getdatalaravel() async {
    var response = await CallApi().getData("halamandepan");
    dataiklan = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        iklanData = dataiklan["dataiklan"];
        vendorData = dataiklan["datarecommend"];
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
    Widget carousel = vendorData == null
        ? Center(child: CircularProgressIndicator())
        : Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      color: Color(0xFFe8308c),
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: InkWell(
                            onTap: () {
                              showCari(
                                context: context,
                                delegate: TextSearch(),
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5)),
                                Icon(Icons.search,
                                    color: Colors.black38.withOpacity(.4)),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5)),
                                Text(
                                  "Cari Data",
                                  style: TextStyle(
                                      color: Colors.black38.withOpacity(.4),
                                      fontSize: 18),
                                ),
                              ],
                            )),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFe8308c),
                      ),
                      height: 150.0,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: new Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return new ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              url +
                                  iklanData[index]["gambar"],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        autoplay: true,
                        itemCount: iklanData == null ? 0 : iklanData.length,
                        pagination: new SwiperPagination(
                          margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                          builder: new SwiperCustomPagination(
                            builder: (BuildContext context,
                                SwiperPluginConfig config) {
                              return new Container(
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      child: new Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          height: 10.0,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child:
                                              new RectSwiperPaginationBuilder(
                                            color: Colors.white,
                                            activeColor: Colors.white,
                                            activeSize: const Size(40.0, 20.0),
                                            size: const Size(10.0, 20.0),
                                          ).build(context, config),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                constraints:
                                    new BoxConstraints.expand(height: 50.0),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    //
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFe8308c),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                    ),
                    //
                    Container(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Product Category",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFe8308c)),
                        ),
                      ),
                    ),
                    //
                    Container(
                      height: 510.0,
                      child: Column(
                        children: <Widget>[
                          //
                          Container(
                            height: 170.0,
                            child: Row(
                              children: <Widget>[
                                //
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                        bottom: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.network(
                                          "http://192.168.1.55/wethinks/public/Img/kategori_image/gedung_pernikahan.jpg",
                                          fit: BoxFit.cover,
                                          height: 100.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                        ),
                                        Center(
                                          child: Text("Gedung Pernikahan"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                        bottom: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.network(
                                          "http://192.168.1.55/wethinks/public/Img/kategori_image/dekorasi_pernikahan.jpg",
                                          fit: BoxFit.cover,
                                          height: 100.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                        ),
                                        Center(
                                          child: Text("Dekorasi Gedung"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
                          Container(
                            height: 170.0,
                            child: Row(
                              children: <Widget>[
                                //
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                        bottom: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.network(
                                          "http://192.168.1.55/wethinks/public/Img/kategori_image/photography_pernikahan.jpg",
                                          fit: BoxFit.cover,
                                          height: 100.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                        ),
                                        Center(
                                          child:
                                              Text("Photographer Pernikahan"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                        bottom: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.network(
                                          "http://192.168.1.55/wethinks/public/Img/kategori_image/undangan_pernikahan.jpg",
                                          fit: BoxFit.cover,
                                          height: 100.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                        ),
                                        Center(
                                          child: Text("Udangan Pernikahan"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
                          Container(
                            height: 170.0,
                            child: Row(
                              children: <Widget>[
                                //
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          width: 0.5,
                                          color: Color(0xffCFCFCF),
                                        ),
                                        bottom: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.network(
                                          "http://192.168.1.55/wethinks/public/Img/kategori_image/band_pernikahan.jpg",
                                          fit: BoxFit.cover,
                                          height: 100.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                        ),
                                        Center(
                                          child: Text("Band Pernikahan"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                        bottom: BorderSide(
                                            width: 0.5,
                                            color: Color(0xffCFCFCF)),
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.network(
                                          "http://192.168.1.55/wethinks/public/Img/kategori_image/sound_pernikahan.jpg",
                                          fit: BoxFit.cover,
                                          height: 100.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                        ),
                                        Center(
                                          child: Text("Sound Pernikahan"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //
                    Container(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Recommend Vendors",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFe8308c)),
                        ),
                      ),
                    ),
                    //
                    Container(
                      child: CarouselSlider(
                        viewportFraction: 0.75,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        height: 350,
                        items: [
                          for (var i = 0; i < vendorData.length; i++)
                            vendorData[i]
                        ].map(
                          (it) {
                            return new ListView(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 10.0,
                                      bottom: 20.0),
                                  width: MediaQuery.of(context).size.width,
                                  child: new InkWell(
                                    borderRadius: BorderRadius.circular(30.0),
                                    onTap: () {},
                                    child: Container(
                                      decoration: new BoxDecoration(
                                          border: Border.all(
                                              width: 0.5,
                                              color: Colors.pinkAccent),
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: new Container(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              height: 200.0,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                child: Image.network(
                                                  "http://192.168.1.55/wethinks/public/Img/vendor_image/" +
                                                      it["img"],
                                                  fit: BoxFit.fitHeight,
                                                  height: 100,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10.0, right: 10.0),
                                              height: 50.0,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  it["nama"],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 18.0),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10.0, right: 10.0),
                                              height: 60.0,
                                              child: Text(
                                                it["deskripsi"],
                                                maxLines: 2,
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                  ],
                ),
              ],
            ),
          );
    return carousel;
    //
  }
}
