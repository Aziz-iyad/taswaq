import 'package:flutter/material.dart';

import 'Model/BNScreen.dart';
import 'homeScreen.dart';
import 'ordersScreen.dart';

class BNP extends StatefulWidget {

  @override
  _BNPState createState() => _BNPState();
}

class _BNPState extends State<BNP> {

  int selectedIndex = 0;


  List<BNScreen> _screens = [
    BNScreen(widget: HomeScreen(), title: 'home'),
    BNScreen(widget: HomeScreen(), title: 'home'),
    BNScreen(widget: OrdersScreen(), title: 'orders'),
  ];



  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (int selectedItemIndex) {
              setState(() {
                selectedIndex = selectedItemIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('حسابي'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                title: Text('طلباتي'),
              )
            ],
          ),
          body: _screens[selectedIndex].widget,
        ),
    );
  }
}
