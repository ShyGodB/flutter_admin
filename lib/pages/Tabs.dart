import 'package:flutter/material.dart';

import 'home/home.dart';
import 'order/order_list.dart';
import 'user/user_list.dart';
import 'tech/tech_list.dart';
import 'app/app.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [
    Home(),
    OrderList(),
    UserList(),
    TechList(),
    AppPage(),
  ];

  List _titleList = ['主页', '订单', '用户', '技师', '应用'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(this._titleList[this._currentIndex]),
            actions: <Widget>[
                Icon(Icons.search),
                // Icon(Icons.menu),
            ],
        ),
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('订单')),
            BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('用户')),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), title: Text('技师')),
            BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text('应用'))
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: this._currentIndex,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
        ));
  }
}
