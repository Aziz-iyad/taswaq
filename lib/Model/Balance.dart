import 'package:flutter/cupertino.dart';
import 'package:taswaq/helpers/db_helper.dart';

class Balance {
  int id;
  String value;

  Balance({@required this.id, @required this.value});

  Balance.fromMap(Map map) {
    this.id = map[DbHelper.balanceIdColumnName];
    this.value = map[DbHelper.balanceValueColumnName];
  }
  toMap() {
    return {
      DbHelper.balanceIdColumnName: this.id,
      DbHelper.balanceValueColumnName: this.value,
    };
  }
}
