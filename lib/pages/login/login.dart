import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './components/login_detail.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['登录', '注册'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(1334),
              color: Colors.white,
            ),
            Image.asset('lib/images/login/loginBg.png'),
            _loginContent(),
            _rightImage(),
            _loginBottom()
          ],
        )
      ),
    );
  }

  // 右边图标
  Widget _rightImage() {
    return Positioned(
        right: 0,
        top: 35.0,
        child: Container(
          width: ScreenUtil().setWidth(400),
          height: ScreenUtil().setHeight(350),
          child: Image.asset(
            'lib/images/login/loginBgLeft.png',
            width: ScreenUtil().setWidth(500),
            height: ScreenUtil().setHeight(300),
            fit: BoxFit.fill,
          ),
        ));
  }

  // 登录的底部
  Widget _loginBottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: ScreenUtil().setHeight(120.0),
        width: ScreenUtil().setHeight(750),
        child: Image.asset(
          'lib/images/login/loginBottom.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 登录from
  Widget _loginContent() {
    return Positioned(
      top: 150.0,
      left: 20,
      child: Container(
        width: ScreenUtil().setWidth(675),
        height: ScreenUtil().setHeight(900),
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
        child: _conTentBox(),
      ),
    );
  }

  Widget _conTentBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_loginTabs(), _tabsPages()],
    );
  }

  // tabs
  Widget _loginTabs() {
    return Container(
      width: ScreenUtil().setWidth(300),
      height: ScreenUtil().setHeight(100),
      child: TabBar(
        controller: _tabController,
        tabs: tabs.map((e) => Tab(text: e)).toList(),
        indicatorColor: Color(0xFF42bae9),
        indicatorWeight: 5.0,
        labelStyle: TextStyle(
          fontSize:  ScreenUtil().setSp(30),
        ),
        labelColor: Color(0xFF42bae9),
        unselectedLabelColor: Colors.black
      ),
    );
  }

  // tabs页面
  Widget _tabsPages() {
    return Container(
      width: ScreenUtil().setWidth(675),
      height: ScreenUtil().setHeight(800),
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          LoginDetail(),
          Text('注册')
        ],
      ),
    );
  }
}
