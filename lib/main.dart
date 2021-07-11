import 'package:flutter/material.dart';
import 'package:taswaq/BNP.dart';
import 'package:taswaq/homeScreen.dart';
import 'package:taswaq/ordersScreen.dart';
import 'package:taswaq/splashScreen.dart';
import 'package:taswaq/welcomeScreen.dart';

import 'InvoiceDetails.dart';
import 'loginScreen.dart';

void main() {
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
      },
    );
  }
}
