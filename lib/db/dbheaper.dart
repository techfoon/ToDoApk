import 'dart:developer';
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

  String todoCheckbox = "checkbox";

  Future<Database> getDB() async {
    if (myDB == null) {
      myDB = await openDB();
    }

    return myDB!;
  }

  Future<Database> openDB() async {
    Directory appDirectory = await getApplicationCacheDirectory();

    log("Direcotory: ${appDirectory.path}");

    String rootPath = appDirectory.path;

    String dbPath = join(rootPath, "todo.db");

    log(dbPath);
    log("DataBase Opening");
    return openDatabase(
      /// no need of await
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE $todoTable($s_no INTEGER PRIMARY KEY AUTOINCREMENT, $todoTableTitle TEXT, $todoTableDescription TEXT, $todoTableDate TEXT, $cardColor TEXT, $todoCheckbox INTEGER)");
      },
    );
  }

//fetchqueries

  Future<List<Map<String, dynamic>>> getAlltodo() async {
    var db = await getDB();
    var allToDo = await db.query(todoTable);

    log("data is feching");

    return allToDo;
  }

  ///insert queryies
  Future<bool> addTodo({
    required String todoTilte,
    required String todoDescription,
    required String todoDate,
    required int todoColor,

    /// coverted into integer
  }) async {
    var db = await getDB();

    int rowsEffected = await db.insert(todoTable, {
      todoTableTitle: todoTilte,
      todoTableDescription: todoDescription,
      todoTableDate: todoDate,
      cardColor: todoColor,
      "checkbox": 0
    });

    if (rowsEffected > 0) {
      log("Data is inserted: Qurey is: $rowsEffected");
      return rowsEffected > 0;
    } else {
      log("Data is not inserted");
      return rowsEffected > 0;
    }
  }

  //Delete TodoData
  Future<void> todoDelete({required int Sn}) async {
    var db = await getDB();

    // Use the `where` clause to delete the entry
    await db.delete(
      todoTable,
      where: 's_no = ?', // Use 'where' to define the condition
      whereArgs: [Sn], // Use 'whereArgs' to pass the argument(s)
    );

    log("Data is deleted: $Sn");
  }




// update check box

  updateCheckBox({required int sNo, required bool cValue}) async {
    var db = await getDB(); // Get the database reference

    // Assuming you have a table named 'todo' with a 'checkbox' column
    int updated = await db.update(
      todoTable, // Table name
      {'checkbox': cValue ? 1 : 0}, // Convert bool to int for database storage
      where: 's_no = ?', // Specify which row to update
      whereArgs: [sNo], // Pass the id of the row
    );

    return updated; // Return the number of affected rows
  }
}
