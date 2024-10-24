import 'package:flutter/material.dart';
import 'package:todo/db/dbheaper.dart';

class CrudModel {
  int? Model_s_no, modelCheckbox = 0;

  String crudTitle, crudDescription, crudDate;

  dynamic cardColor;

  CrudModel(
      {required this.crudTitle,
      required this.crudDescription,
      required this.crudDate,
      required this.cardColor,
      required this.modelCheckbox});

//FromMap  MapToModel

  factory CrudModel.fromMap(Map<String, dynamic> map) {
    return CrudModel(
        // Model_s_no: map[DBhelper.getMyinstance().s_no],
        crudTitle: map[DBhelper.getMyinstance().todoTableTitle],
        crudDescription: map[DBhelper.getMyinstance().todoTableTitle],
        crudDate: map[DBhelper.getMyinstance().todoTableDate],
        cardColor: map[DBhelper.getMyinstance().cardColor],
        modelCheckbox: map[DBhelper.getMyinstance().cardColor]);
  }

//toMap  ModeltoMap
  Map<String, dynamic> toMap() {
    return {
      DBhelper.getMyinstance().todoTableTitle: crudTitle,
      DBhelper.getMyinstance().todoTableDescription: crudDescription,
      DBhelper.getMyinstance().todoTableDate: crudDate,
      DBhelper.getMyinstance().cardColor: cardColor,
      DBhelper.getMyinstance().todoCheckbox: modelCheckbox
    };
  }
}
