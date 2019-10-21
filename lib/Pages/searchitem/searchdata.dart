import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:wethinks/api/api.dart';
import 'package:wethinks/Pages/Vendors/detailvendor.dart';
import 'package:wethinks/UI/kinarian-icon/kinarian_icons.dart';
import 'pluginsearch.dart';

class TextSearch extends CariDelegate<String> {
  @override
  Widget buildActions(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 40,
      margin: EdgeInsets.symmetric(
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: Colors.black26.withOpacity(.15),
        border: Border.all(style: BorderStyle.none),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(right: 0),
      child: IconButton(
        alignment: Alignment.centerLeft,
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          focustext(context);
        },
      ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return HasilCari(
      cariText: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
//
//
//
// Hasil Search

class HasilCari extends StatefulWidget {
  final String cariText;

  const HasilCari({
    Key key,
    this.cariText,
  }) : super(key: key);

  @override
  _HasilCariState createState() => _HasilCariState();
}

class _HasilCariState extends State<HasilCari> {
  final String _url = 'http://192.168.1.55/wethinks/public/Img/';
  var menulist = "grid";
  String _mySelection = "1", _selectionfilter = "Nama A-Z";
  Map dataketegory, datavendor;
  List listkategory, listvendor;
  List dat;
  //
//
  List<Container> listdata = new List();
//

  Future getdatalaravel() async {
    var response = await CallApi().getData("halamanvendor");
    dataketegory = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        listkategory = dataketegory["kategori"];
      });
    }
  }

  void filterData() async {
    var response;
    var caridata = widget.cariText;
    var orderby = this.dat != null ? this.dat[0]["order"] : null;
    var katid = this.dat != null ? this.dat[0]["kategory"] : null;
    var dats = {'caridata': caridata, 'kategory': katid, 'order': orderby};
    response = await CallApi().filterData(dats, "filtervendor");
    datavendor = json.decode(response.body);
    setState(() {
      listvendor = datavendor["vendor"];
    });
  }

  @override
  void initState() {
    getdatalaravel();
    filterData();
    super.initState();
  }

  @override
  void dispose() {
    getdatalaravel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return listkategory == null
        ? Center(child: CircularProgressIndicator())
        : SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  height: 60.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.49,
                        child: DropdownButton(
                          hint: Text("Pilih Kategory"),
                          items: listkategory.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['kategory']),
                              value: item['id'].toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _mySelection = newVal;
                              int _val = int.parse(_mySelection);
                              dat = [
                                {
                                  'caridata': widget.cariText,
                                  'kategory': listkategory[_val - 1]
                                      ['kategory'],
                                  'order': _selectionfilter
                                }
                              ];
                            });
                            return filterData();
                          },
                          value: _mySelection,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: DropdownButton(
                          hint: Text("Filter"),
                          items: <String>['Nama A-Z', 'Nama Z-A']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _selectionfilter = newVal;
                              int _val = int.parse(_mySelection);
                              dat = [
                                {
                                  'caridata': widget.cariText,
                                  'kategory': listkategory[_val - 1]
                                      ['kategory'],
                                  'order': _selectionfilter
                                }
                              ];
                            });
                            return filterData();
                          },
                          value: _selectionfilter,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            menulist == "grid"
                                ? menulist = "list"
                                : menulist = "grid";
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.08,
                          height: 50.0,
                          child: menulist == "grid"
                              ? Icon(Kinarian.listmenu)
                              : Icon(Kinarian.gridmenu),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: menulist == "grid" ? 2 : 1,
                    childAspectRatio: menulist == "grid" ? 0.65 : 2,
                    children: List.generate(
                      listvendor == null ? 0 : listvendor.length,
                      (i) {
                        return menulist == "grid"
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailVendors(
                                        id: listvendor[i]["id"],
                                        index: i,
                                        img: listvendor[i]["img"],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0),
                                        ),
                                        Container(
                                          width: 170,
                                          height: 150.0,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Hero(
                                              tag: "vendorimage$i",
                                              child: Image.network(
                                                _url +
                                                    "vendor_image/" +
                                                    listvendor[i]["img"],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 170,
                                          height: 30,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            listvendor[i]["nama"],
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              color: Color(0xFFe8308c),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          width: 170,
                                          child: Text(
                                            listvendor[i]["deskripsi"],
                                            maxLines: 3,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailVendors(
                                        id: listvendor[i]["id"],
                                        index: i,
                                        img: listvendor[i]["img"],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            height: 200,
                                            width: 168.0,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Hero(
                                                tag: "vendorimage$i",
                                                child: Image.network(
                                                  _url +
                                                      "/vendor_image/" +
                                                      listvendor[i]["img"],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.0),
                                                height: 30,
                                                width: 182,
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  listvendor[i]["nama"],
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
                                                height: 125,
                                                width: 182,
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  listvendor[i]["deskripsi"],
                                                  maxLines: 8,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.0,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
