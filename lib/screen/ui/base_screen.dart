import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mangabuzz/core/util/connectivity_check.dart';
import 'package:mangabuzz/screen/ui/bookmark/bookmark_screen.dart';
import 'package:mangabuzz/screen/ui/history/history_screen.dart';
import 'package:mangabuzz/screen/ui/home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  ConnectivityCheck connectivityCheck = ConnectivityCheck();
  static List<Widget> widgetList = <Widget>[
    HomePage(),
    Text("WOOOOW"),
    BookmarkPage(),
    HistoryPage()
  ];

  @override
  void initState() {
    connectivityCheck.checkConnectivity().then((value) => {
          if (value == true)
            {
              // TODO some bloc
            }
          else
            {
              // TODO get error page
            }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: null,
      body: widgetList.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(15),
                vertical: ScreenUtil().setHeight(10),
              ),
              child: GNav(
                  gap: 8,
                  activeColor: Theme.of(context).primaryColor,
                  color: Colors.grey,
                  textStyle: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 14,
                      color: Theme.of(context).primaryColor),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  duration: Duration(milliseconds: 800),
                  tabBackgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.2),
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      iconSize: ScreenUtil().setHeight(70),
                      text: 'Home',
                    ),
                    GButton(
                      icon: LineIcons.search,
                      iconSize: ScreenUtil().setHeight(70),
                      text: 'Explore',
                    ),
                    GButton(
                      icon: Icons.favorite_border,
                      iconSize: ScreenUtil().setHeight(70),
                      text: 'Bookmark',
                    ),
                    GButton(
                      icon: LineIcons.history,
                      iconSize: ScreenUtil().setHeight(60),
                      text: 'History',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    print(index);
                    setState(() {
                      _selectedIndex = index;
                    });
                  }),
            ),
          )),
    );
  }
}
