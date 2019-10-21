import 'package:flutter/material.dart';
import 'package:wethinks/UI/kinarian-icon/kinarian_icons.dart';
import 'dart:convert';
import 'package:wethinks/api/api.dart';
import 'dart:async';
import 'detailvendor.dart';

class ListDataVendor extends StatefulWidget {
  final String username;

  const ListDataVendor({Key key, this.username}) : super(key: key);
  @override
  _ListDataVendorState createState() => _ListDataVendorState();
}

class _ListDataVendorState extends State<ListDataVendor> {
  final String _url = 'http://192.168.1.55/wethinks/public/img/';
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
    var orderby = this.dat != null ? this.dat[0]["order"] : this.dat;
    var katid = this.dat != null ? this.dat[0]["kategory"] : this.dat;
    var dats = {'kategory': katid, 'order': orderby};
    this.dat != null
        ? response = await CallApi().filterData(dats, "filtervendor")
        : response = await CallApi().getData("nonfiltervendor");
    datavendor = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        listvendor = datavendor["vendor"];
      });
    }
  }

  @override
  void initState() {
    getdatalaravel();
    filterData();
    super.initState();
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
                                  'kategory': listkategory[_val-1]['kategory'],
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
                                  'kategory': listkategory[_val-1]['kategory'],
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
