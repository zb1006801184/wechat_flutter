import 'package:flutter/material.dart';
import 'package:wechat_flutter/unitls/nav_bar_config.dart';
import '../contact/contact.dart';
import '../discover/discover.dart';
import '../mine/mine.dart';
import '../wechat/wechat.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  List titles = ['微信', '通讯录', '发现', '我'];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget itemViewC(int index) {
    List barItemPages = [Wechat(), Contact(), Discover(), Mine()];
    return barItemPages[index];
  }

  _rightClick() {
    if (_selectedIndex == 0) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _selectedIndex == 3
            ? null
            : NavBarConfig().tabbarAppBar(titles[_selectedIndex], context,
                rightAction: _rightClick),
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage("images/tabbar/tabbar_mainframe_25x23.png"),
                  width: 25,
                  height: 23,
                ),
                activeIcon: Image(
                  image:
                      AssetImage("images/tabbar/tabbar_mainframeHL_25x23.png"),
                  width: 25,
                  height: 23,
                ),
                title: Text('微信')),
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage("images/tabbar/tabbar_contacts_27x23.png"),
                  width: 27,
                  height: 23,
                ),
                activeIcon: Image(
                  image:
                      AssetImage("images/tabbar/tabbar_contactsHL_27x23.png"),
                  width: 27,
                  height: 23,
                ),
                title: Text('通讯录')),
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage("images/tabbar/tabbar_discover_23x23.png"),
                  width: 23,
                  height: 23,
                ),
                activeIcon: Image(
                  image:
                      AssetImage("images/tabbar/tabbar_discoverHL_23x23.png"),
                  width: 23,
                  height: 23,
                ),
                title: Text('发现')),
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage("images/tabbar/tabbar_me_23x23.png"),
                  width: 23,
                  height: 23,
                ),
                activeIcon: Image(
                  image: AssetImage("images/tabbar/tabbar_meHL_23x23.png"),
                  width: 23,
                  height: 23,
                ),
                title: Text('我')),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF57BE6A),
          unselectedItemColor: Color(0xFF181818),
          onTap: _onItemTapped,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            itemViewC(0),
            itemViewC(1),
            itemViewC(2),
            itemViewC(3),
          ],
        ));
  }
}
