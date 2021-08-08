import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taswaq/Model/Balance.dart';
import 'dart:io';

import 'package:taswaq/Model/Order.dart';
import 'package:taswaq/Model/User.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  static String dbName = 'taswaqDb.db';

  static String orderTableName = 'Orders';
  static String orderIdColumnName = 'id';
  static String orderSenderNameColumnName = 'senderName';
  static String orderSenderAddressColumnName = 'senderAddress';
  static String orderReceiverNameColumnName = 'receiverName';
  static String orderReceiverAddressColumnName = 'receiverAddress';
  static String orderDescriptionNameColumnName = 'Description';
  static String orderNotesNameColumnName = 'notes';
  static String orderPriceNameColumnName = 'orderPrice';
  static String orderDeliveryFeeNameColumnName = 'deliveryFee';
  static String orderTotalFeeNameColumnName = 'totalFee';
  static String orderBalanceIdName = 'balId';
  //
  static String balanceTableName = 'Balance';
  static String balanceIdColumnName = 'id';
  static String balanceValueColumnName = 'value';
  //
  static String userTableName = 'User';
  static String userIdColumnName = 'id';
  static String userNameColumnName = 'userName';
  static String userPasswordColumnName = 'userPassword';
  //
  // static String myUserOrderTableName = 'myUserOrder';
  // static String myUserOrderIdColumnName = 'id';
  // static String myUserOrderNameColumnName = 'userName';
  // static String myUserOrderColumnName = 'userPassword';

  Database database;

  initDataBase() async {
    database = await getDataBaseConnection();
  }

  Future<Database> getDataBaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$dbName';
    Database database = await openDatabase(
      path,
      version: 1,
      onConfigure: (db) {
        db.execute('PRAGMA foreign_keys=ON');
      },
      onCreate: (db, v) {
        print('data base have been created');
        db.execute('''CREATE TABLE $orderTableName (
          $orderIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
           $orderSenderNameColumnName TEXT,
           $orderSenderAddressColumnName TEXT,
           $orderReceiverNameColumnName  TEXT,
           $orderReceiverAddressColumnName  TEXT,
           $orderDescriptionNameColumnName TEXT,
           $orderNotesNameColumnName TEXT,
           $orderPriceNameColumnName TEXT,
           $orderDeliveryFeeNameColumnName TEXT,
           $orderTotalFeeNameColumnName TEXT,
           $orderBalanceIdName INTEGER,
            FOREIGN KEY($orderBalanceIdName) REFERENCES $balanceTableName($balanceIdColumnName) ON DELETE CASCADE)''');

        db.execute('''CREATE TABLE $balanceTableName (
            $balanceIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
           $balanceValueColumnName TEXT)''');

        db.execute('''CREATE TABLE $userTableName (
            $userIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
           $userNameColumnName TEXT,
           $userPasswordColumnName TEXT)''');

        // db.execute('''CREATE TABLE $userTableName (
        //     $userIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
        //    $userNameColumnName TEXT,
        //    $userPasswordColumnName TEXT)''');
      },
      onOpen: (database) {
        print('data base is open');
      },
    );
    return database;
  }

  insertOrder(Order order) async {
    int rowNum = await database.insert(orderTableName, order.toMap());
    print(rowNum);
  }

  insertBalance(Balance balance) async {
    int rowNum = await database.insert(balanceTableName, balance.toMap());
    print(rowNum);
  }

  insertUser(User user) async {
    int rowNum = await database.insert(userTableName, user.toMap());
    print(rowNum);
  }

  Future<List<Order>> getAllOrders() async {
    List<Map<String, Object>> result = await database.query(orderTableName);
    List orders = result.map((e) {
      return Order.fromMap(e);
    }).toList();
    return orders;
  }

  Future<Order> getSpecificOrder(int id) async {
    List<Map<String, Object>> result =
        await database.query(orderTableName, where: 'id=?', whereArgs: [id]);
    Order order = Order.fromMap(result.first);
    return order;
  }

  Future<Order> getSpecificOrderByBalanceId(int id) async {
    List<Map<String, Object>> result =
        await database.query(orderTableName, where: 'balId=?', whereArgs: [id]);
    Order order = Order.fromMap(result.first);
    return order;
  }

  //user Login
  Future saveUser(User user) async {
    int rowNum = await database.insert(userTableName, user.toMap());
    print(rowNum);
  }

  Future<User> getLogin(String user, String password) async {
    List<Map<String, Object>> result = await database.rawQuery(
        "SELECT * FROM user WHERE username = '$user' and password = '$password'");

    if (result.length > 0) {
      User user = User.fromMap(result.first);
      return user;
    }
    return null;
  }

  Future<List<User>> getAllUser() async {
    List<Map<String, Object>> result = await database.query(userTableName);
    List users = result.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }

  Future<User> getSpecificUser(String userName) async {
    List<Map<String, Object>> result = await database
        .query(userTableName, where: 'userName=?', whereArgs: [userName]);
    User user = User.fromMap(result.first);
    return user;
  }
}
