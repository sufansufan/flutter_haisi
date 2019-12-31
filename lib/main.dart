import 'package:flutter/material.dart';
// 状态管理
import 'package:provide/provide.dart';
import './provide/login.dart';
// import 'package:haisi_flutter/pages/start_up/start_up.dart';
// import './pages/home_pages/my_home_page.dart';
// import './pages/start_up/start_up.dart';
import './pages/login/login.dart';

void main() {
  var loginProvide = LoginProvide();
  var providers = Providers();
  providers
    ..provide(Provider<LoginProvide>.value(loginProvide));
  return runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '海思医疗',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF42bae9),
      ),
      home: Login(),
    );
  }
}
