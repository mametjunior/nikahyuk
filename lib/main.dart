import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:wethinks/Pages/auth/login.dart';
import 'package:wethinks/Pages/halamandepan.dart';
import 'package:wethinks/Pages/vendors/list.dart';
import 'package:wethinks/Pages/chat/chat.dart';
import 'Pages/notif/notif.dart';
import 'package:wethinks/UI/kinarian-icon/kinarian_icons.dart';
import 'package:wethinks/Pages/setting_users/halaman_user_setting.dart';
import 'package:wethinks/Pages/shopping_cart/cart.dart';
//
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/ourshop/ourshop.dart';
import 'UI/slidepageroute/slide.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nikah Yuk',
      debugShowCheckedModeBanner: false,
      home: Layouts(),
    );
  }
}

class Layouts extends StatefulWidget {
  final Widget laman;

  const Layouts({Key key, this.laman}) : super(key: key);
  @override
  _LayoutsState createState() => _LayoutsState();
}

class _LayoutsState extends State<Layouts> {
  Widget loadhalaman = HalamanDepan();
  String tetx = "122";
  String user;
  Color warna = Color(0xFFFF62BC);

  Future loaduser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = prefs.getString('user');
  }

  @override
  void initState() {
    widget.laman == null ? loadhalaman = loadhalaman : loadhalaman = widget.laman;
    loaduser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFe8308c),
        elevation: 0.0,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nikahyuk',
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 0.0, top: 7.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalNotif(
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Kinarian.notification,
                    ),
                    iconSize: 35,
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:
                        //     Border.all(width: 3, color: Color(0xFFe8308c),style: BorderStyle.solid),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFe8308c),
                            blurRadius: 0,
                            spreadRadius: 3,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    padding: tetx.length == 1
                        ? EdgeInsets.symmetric(horizontal: 5, vertical: 3)
                        : tetx.length == 2
                            ? EdgeInsets.all(3)
                            : EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                    child: Text(
                      tetx.length > 2 ? "99+" : tetx,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFe8308c),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(right: 20.0, top: 5.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShoppingCart(),
                          ),
                        );
                      },
                      icon: Icon(
                        Kinarian.shopping_cart,
                      ),
                      iconSize: 30,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border:
                          //     Border.all(width: 3, color: Color(0xFFe8308c),style: BorderStyle.solid),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFe8308c),
                              blurRadius: 0,
                              spreadRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      padding: tetx.length == 1
                          ? EdgeInsets.symmetric(horizontal: 5, vertical: 3)
                          : tetx.length == 2
                              ? EdgeInsets.all(3)
                              : EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 5),
                      child: Text(
                        tetx.length > 2 ? "99+" : tetx,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFe8308c),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
      body:loadhalaman,
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 3, color: Colors.black45.withOpacity(.2))
        ]),
        child: Row(
          children: <Widget>[
            BottomNavi(
              callback: () {
                setState(() {
                  loadhalaman = HalamanDepan();
                });
              },
              load: loadhalaman,
              halaman: HalamanDepan(),
              flaction: 'icon_flare/Home2.flr',
              icon: Kinarian.home,
              animation: 'home',
              namahal: "Home",
            ),
            BottomNavi(
              callback: () {
                setState(() {
                  loadhalaman = OurShop();
                });
              },
              load: loadhalaman,
              halaman: OurShop(),
              flaction: 'icon_flare/gift2.flr',
              icon: Kinarian.gift,
              animation: 'play',
              namahal: "Our Shop",
            ),
            BottomNavi(
              callback: () {
                setState(() {
                  loadhalaman = ListDataVendor();
                });
              },
              load: loadhalaman,
              halaman: ListDataVendor(),
              flaction: 'icon_flare/gift2.flr',
              icon: Kinarian.shop,
              animation: 'play',
              namahal: "Vendors",
            ),
            BottomNavi(
              callback: () {
                setState(() {
                  user == null
                      ? Navigator.of(context)
                          .push(SlideTopRoute(page: LoginPages()))
                      : loadhalaman = HalamanChat();
                   loadhalaman = HalamanChat();
                });
              },
              load: loadhalaman,
              halaman: user == null ? LoginPages() : HalamanChat(),
              flaction: 'icon_flare/gift2.flr',
              icon: Kinarian.speech_bubble,
              animation: 'play',
              namahal: "Chat",
            ),
            BottomNavi(
              callback: () {
                setState(() {
                  user == null
                      ? Navigator.of(context).push(
                          SlideTopRoute(
                            page: LoginPages(),
                          ),
                        )
                      : loadhalaman = HalamanUserSetting();
                  loadhalaman = HalamanUserSetting();
                });
              },
              load: loadhalaman,
              halaman: user == null ? LoginPages() : HalamanUserSetting(),
              flaction: 'icon_flare/gift2.flr',
              icon: Kinarian.profile,
              animation: 'play',
              namahal: "Chat",
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavi extends StatelessWidget {
  final Widget halaman, load;
  final String namahal, flaction, animation;
  final VoidCallback callback;
  final IconData icon;
  BottomNavi(
      {this.halaman,
      this.animation,
      this.callback,
      this.flaction,
      this.icon,
      this.namahal,
      this.load});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      child: InkWell(
        onTap: callback,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 0),
              height: 40,
              child: Center(
                child: load == halaman
                    ? FlareActor(
                        flaction,
                        animation: animation,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        icon,
                        color: Color(0xFFe8308c),
                      ),
              ),
            ),
            Container(
              height: 20,
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                namahal,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFe8308c),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
