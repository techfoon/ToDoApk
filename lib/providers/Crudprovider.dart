import 'package:flutter/material.dart';
import 'package:todo/db/dbheaper.dart';

class Crudprovider extends ChangeNotifier {
  List<Map<String, dynamic>> _pData = [];
  DBhelper mainDB = DBhelper.getMyinstance();

  void addMap(Map<String, dynamic> values) async {

   // _pData = await mainDB.addTodo(todoTilte: todoTilte, todoDescription: todoDescription, todoDate: todoDate, todoColor: todoColor)

    notifyListeners();
  }

  List<Map<String, dynamic>> getMap() {
    return _pData;
  }
}
