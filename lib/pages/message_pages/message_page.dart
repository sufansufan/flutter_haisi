import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './message_list.dart';

class topBarNav {
  final String url;
  final String title;
  topBarNav(this.url, this.title);
}

class MessagePage extends StatelessWidget {
  final List<topBarNav> topBarList = [
    topBarNav('lib/images/message/call.png', '查诊呼叫'),
    topBarNav('lib/images/message/target.png', '健康超标'),
    topBarNav('lib/images/message/community.png', '社区推送'),
    topBarNav('lib/images/message/system.png', '系统通知'),
  ];
  MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(520),
                ),
                Image(
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(470),
                  fit: BoxFit.fill,
                  image: AssetImage("lib/images/message/messageTop.png"),
                ),
                Positioned(
                  top: 180,
                  left: 20,
                  child: Container(
                    width: ScreenUtil().setWidth(670),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: _topBar(context),
                  ),
                ),
              ],
            ),
            Container(
              width: ScreenUtil().setWidth(670),
              height: ScreenUtil().setHeight(770),
              child: MessageList(),
            )
          ],
        ),
      )
    );
  }

  Widget _topBar(context) {
    return Container(
      width: ScreenUtil().setWidth(670),
      height: ScreenUtil().setHeight(150),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        padding: EdgeInsets.only(top: 10.0),
        children: topBarList.map((item) {
          return _topBarBox(context, item);
        }).toList()
      ),
    );
  }

  Widget _topBarBox(BuildContext context,item) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              item.url,
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(70),
            ),
            Text(
              item.title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Colors.black87
              ),
            )
          ],
        ),
      )
    );
  }
}
