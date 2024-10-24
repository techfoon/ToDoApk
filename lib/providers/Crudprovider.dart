import 'package:flutter/material.dart';
import 'package:todo/db/dbheaper.dart';
import 'package:todo/model/crudmodel.dart';

class Crudprovider extends ChangeNotifier {
  List<Map<String, dynamic>> _pData = [];
  // DBhelper mainDB = DBhelper.getMyinstance();

  DBhelper mainDB;
  Crudprovider({required this.mainDB});

  void addMap({required CrudModel newCrud}) async {
    //// _pData = await mainDB.addTodo(todoTilte: todoTilte, todoDescription: todoDescription, todoDate: todoDate, todoColor: todoColor)

    bool check = await mainDB.addTodo(
        todoTilte: newCrud.crudTitle,
        todoDescription: newCrud.crudDescription,
        todoDate: newCrud.crudDate,
        todoColor: newCrud.cardColor);

    if (check) {
      _pData = await mainDB.getAlltodo();
      notifyListeners();
    }
  }

  void gettheData() async {
    _pData = await mainDB.getAlltodo();
    notifyListeners();
  }

List<Map<String, dynamic>> fetchMap() {
    return _pData;
  }
}
