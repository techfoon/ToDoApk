import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBhelper {
  DBhelper._();

  static DBhelper getMyinstance() {
    return DBhelper._();
  }

  Database? myDB;
  String todoTableTitle = "todoTitle",
      todoTableDescription = "todoDescription",
      todoTableDate = "todoDate",
      s_no = "s_no",
      todoTable = "todoTable",
      cardColor = "cardColor";

  Future<Database> getDB() async {
    if (myDB == null) {
      myDB = await openDB();
    }

    return myDB!;
  }

  Future<Database> openDB() async {
    Directory appDirectory = await getApplicationCacheDirectory();

    String rootPath = appDirectory.path;

    String dbPath = join(rootPath, "todo.db");

    return await openDatabase(
      /// no need of await
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.rawQuery(
            "create table $todoTable($s_no integer primary key autoincrement, $todoTableTitle text, $todoTableDescription text, $todoTableDate text , $cardColor text)");
      },
    );
  }

  ///insert queryies
}
