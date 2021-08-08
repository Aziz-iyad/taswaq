import 'package:taswaq/helpers/db_helper.dart';

class User {
  int id;
  String username;
  String password;
  User({this.username, this.password, this.id});

  User.fromMap(Map map) {
    this.id = map[DbHelper.userIdColumnName];
    this.username = map[DbHelper.userNameColumnName];
    this.password = map[DbHelper.userPasswordColumnName];
  }
  toMap() {
    return {
      DbHelper.userNameColumnName: this.username,
      DbHelper.userPasswordColumnName: this.password,
    };
  }
}
