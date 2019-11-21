import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class swiperItem {
  final String url;
  final String title;
  final String desc;
  swiperItem(this.url, this.title, this.desc);
}

class StartSwiper extends StatelessWidget {
  final List<swiperItem> swiperList = [
    swiperItem('lib/images/startUp/one.png', '数据统计', '直观掌握用户的健康实况'),
    swiperItem('lib/images/startUp/two.png', '消息提醒', '及时接收用户的查诊请求'),
    swiperItem('lib/images/startUp/three.png', '套餐服务', '致力于个用户最贴心的保障')
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(600),
      height: ScreenUtil().setHeight(1200),
      margin: EdgeInsets.only(top: 50.0),
      color: Colors.white,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Image.asset(
                "${swiperList[index].url}",
                fit: BoxFit.fill,
              ),
              Text(
                '${swiperList[index].title}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(50),
                  decoration: TextDecoration.none
                ),
              ),
              Text(
                '${swiperList[index].desc}',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: ScreenUtil().setSp(34),
                  decoration: TextDecoration.none
                ),
              )
            ],
          );
        },
        itemCount: swiperList.length,
        pagination: SwiperPagination(),
        autoplay: false,
      ),
    );
  }
}
