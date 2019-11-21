import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginDetail extends StatefulWidget {
  LoginDetail({Key key}) : super(key: key);

  @override
  _LoginDetailState createState() => _LoginDetailState();
}

class _LoginDetailState extends State<LoginDetail> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  Color _color;
  var _dropValue;
  @override
  void initState() {
    super.initState();
    _color = Color(0xFF42BAE9);
  }

  final List<DropdownMenuItem> dropdownMenuItem = [
    DropdownMenuItem(
      child: Text('请选择你的身份'),
      value: '0',
    ),
    DropdownMenuItem(
      child: Text('医生'),
      value: '1',
    ),
    DropdownMenuItem(
      child: Text('普通用户'),
      value: '2',
    ),
  ];

  InputDecoration inputDecoration(String url, String title) {
    return InputDecoration(
      icon: Image.asset('${url}',
          width: ScreenUtil().setWidth(40), height: ScreenUtil().setHeight(40)),
      contentPadding: EdgeInsets.symmetric(vertical: 13.0),
      hintText: '${title}',
      hintStyle: TextStyle(
        color: _color,
      ),
      border: InputBorder.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: loginKey,
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(650),
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              margin: EdgeInsets.only(top: 30.0),
              decoration: BoxDecoration(
                color: Color(0xFFecf8fd),
                borderRadius: BorderRadius.circular(50.0),
              ),
              // alignment: Alignment.topRight,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Image.asset('lib/images/login/name.png', width: ScreenUtil().setWidth(40), height: ScreenUtil().setHeight(40)),
                  ),
                  DropdownButton(
                    items: dropdownMenuItem,
                    hint: Text('请选择你的身份', style: TextStyle(color: _color, fontSize: ScreenUtil().setSp(32)),),
                    style: TextStyle(
                      color: _color,
                    ),
                    value: _dropValue,
                    iconEnabledColor: _color,
                    onChanged: (T) {
                      setState(() {
                        _dropValue = T;
                      });
                    },
                  )
                ],
              )
            ),
            Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                margin: EdgeInsets.only(top: 30.0),
                decoration: BoxDecoration(
                  color: Color(0xFFecf8fd),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: TextFormField(
                  decoration:
                      inputDecoration('lib/images/login/edit.png', '请输入账号'),
                  style: TextStyle(fontSize: ScreenUtil().setSp(32)),
                )),
            Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                margin: EdgeInsets.only(top: 30.0),
                decoration: BoxDecoration(
                  color: Color(0xFFecf8fd),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: TextFormField(
                  decoration:
                      inputDecoration('lib/images/login/lock.png', '请输入密码'),
                  style: TextStyle(fontSize: ScreenUtil().setSp(32)),
                )),
            Container(
                width: ScreenUtil().setWidth(650),
                height: ScreenUtil().setHeight(80),
                margin: EdgeInsets.only(top: 30.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    '登录',
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(34)),
                  ),
                  color: Color(0xFF42BAE9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                )),
            _forgetPassword()
          ],
        ),
      ),
    );
  }

  Widget _forgetPassword() {
    return Container(
      alignment: Alignment.bottomRight,
      child: FlatButton(
        onPressed: () {},
        child: Text('忘记密码？', style: TextStyle(color: _color)),
      ),
    );
  }
}
