import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'dart:convert';
import 'package:provide/provide.dart';
import '../../provide/login.dart';

showPicker(BuildContext context, String PickerData) {
  Picker picker = Picker(
      adapter: PickerDataAdapter<String>(
          pickerdata: JsonDecoder().convert(PickerData), isArray: true),
      hideHeader: true,
      changeToFirst: true,
      textAlign: TextAlign.center,
      textStyle: TextStyle(color: Colors.black26),
      selectedTextStyle: TextStyle(color: Color(0xFF42BAE9)),
      columnPadding: EdgeInsets.all(8.0),
      cancelText: '取消',
      confirmText: '确定',
      onConfirm: (Picker picker, List value) {
        print(value);
        // print(picker.getSelectedValues());
        Provide.value<LoginProvide>(context).changeRoles(value.toString());
      });
  picker.showDialog(context);
}
