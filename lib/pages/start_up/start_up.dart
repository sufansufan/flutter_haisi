import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home_pages/my_home_page.dart';
import './start_swiper.dart';

class StartUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height,
            ),
            Center(
              child: StartSwiper(),
            ),
            Positioned(
                right: 20.0,
                bottom: 25.0,
                child: GestureDetector(
                  child: Text(
                    '立即体验 >',
                    style: TextStyle(
                        color: Color(0xFF42BAE9),
                        fontSize: ScreenUtil().setSp(30),
                        decoration: TextDecoration.none),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return MyHomePage();
                    }));
                   /*  Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyHomePage();
                    })); */
                  },
                ))
          ],
        ),
      ),
    );
  }
}
