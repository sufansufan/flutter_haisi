import 'package:flutter/material.dart';

class LoginProvide with ChangeNotifier {
  String roles = "[]";
  int allGoodsCount = 0;
  changeRoles(value) {
    print(value);
    roles = value;
    notifyListeners();
  }
}
