import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MessageList extends StatelessWidget {

  GlobalKey<RefreshIndicatorState> _headerKey = new GlobalKey<RefreshIndicatorState>();

  MessageList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EasyRefresh(
        header: ClassicalHeader(
          key: _headerKey,
          bgColor: Color.fromRGBO(248, 248, 248, 1),
          textColor: Colors.black26,
          showInfo: true,
          noMoreText: '',
          infoText: '更新中',
          infoColor: Colors.black38,
        ),
        child: ListView.builder(
          itemCount: 1,
          padding: EdgeInsets.only(bottom: 10.0),
          itemBuilder: (context, index) {
            return _item(index);
          }
        ),
        onRefresh: () async {
          print('下拉加载加载中');
        },
      )
    );
  }

  Widget _item(int index) {
    // return Container(
    //   alignment: Alignment.center,
    //   child: Text('暂无数据', style: TextStyle(color: Colors.black45, fontSize: ScreenUtil().setSp(34))),
    // );
    return Container(
      height: ScreenUtil().setHeight(130),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(100),
            margin: EdgeInsets.only(right: 5.0),
            child: Image.asset('lib/images/message/defaultImg.png'),
          ),
          Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                width: ScreenUtil().setWidth(500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text('田大妈',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(32))),
                    ),
                    Container(
                      child: Text(
                        '下午1:30',
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: ScreenUtil().setSp(30)),
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.topLeft,
                child: Text(
                  '身体不适，发送查诊呼叫',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: ScreenUtil().setSp(30),
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
