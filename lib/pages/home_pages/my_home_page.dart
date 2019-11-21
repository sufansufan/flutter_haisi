import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 控件
import '../message_pages/message_page.dart';
import '../user_pages/user_page.dart';
import '../my_pages/my_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<BottomNavigationBarItem> bottomBars = [
    BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
    BottomNavigationBarItem(icon: Icon(Icons.perm_identity), title: Text('用户')),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('我的'))
  ];

  final List<Widget> bottomBarList = [MessagePage(), UserPage(), MyPage()];

  // 选中的bottomBar
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO(69, 189, 253, 1),
        unselectedItemColor: Color.fromRGBO(16, 16, 16, 1),
        currentIndex: currentIndex,
        items: bottomBars,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: bottomBarList
      )
    );
  }
}
