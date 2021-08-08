import 'package:flutter/material.dart';
import 'package:taswaq/Model/Balance.dart';
import 'package:taswaq/helpers/db_helper.dart';
import 'package:taswaq/login/registerScreen.dart';
import 'package:taswaq/screens/adminScreen.dart';
import 'MyWidget/BNP.dart';
import 'screens/homeScreen.dart';
import 'screens/ordersScreen.dart';
import 'screens/splashScreen.dart';
import 'screens/welcomeScreen.dart';
import 'screens/InvoiceDetailsScreen.dart';
import 'login/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDataBase();
  // Balance rowNum1 = Balance(value: '50\$', id: 1);
  // Balance rowNum2 = Balance(value: '100\$', id: 2);
  // Balance rowNum3 = Balance(value: '200\$', id: 3);
  // DbHelper.dbHelper.insertBalance(rowNum1);
  // DbHelper.dbHelper.insertBalance(rowNum2);
  // DbHelper.dbHelper.insertBalance(rowNum3);
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/orders': (context) => OrdersScreen(),
        '/bnp': (context) => BNP(),
        '/details': (context) => InvoiceDetails(),
        '/admin': (context) => AdminScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
