import 'package:flutter/material.dart';

class Mapprovider extends ChangeNotifier {
  List<Map<String, dynamic>> _mData = [];

  void addMap(Map<String, dynamic> values) {
    _mData.add(values);

    notifyListeners();
  }

  List<Map<String, dynamic>> getMap() {
    return _mData;
  }
}
