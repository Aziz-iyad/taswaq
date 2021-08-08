import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taswaq/Model/User.dart';
import 'package:taswaq/MyWidget/BNP.dart';
import '../MyWidget/myButton.dart';

class WelcomeScreen extends StatelessWidget {
  String userName;
  WelcomeScreen({this.userName});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Delivery_vector.png'),
              SizedBox(
                height: 71,
              ),
              Text(
                "أهلا بك $userName ",
                style: TextStyle(fontSize: 28, color: Color(0xFF4A4B4D)),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 52),
                child: Text(
                  "اضغط علي بدء العمل لتسجيل بدء عملك بالمكتب",
                  style: TextStyle(fontSize: 16, color: Color(0xFF7C7D7E)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              MyButton(
                height: 56,
                text: "بدء العمل",
                color: Color(0xFFFC6011),
                text_size: 20,
                text_border_color: Colors.white,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => BNP(
                                id: 1,
                              )),
                      (route) => false);

                  print(userName);
                },
              ),
              SizedBox(
                height: 24,
              ),
              TextButton(
                child: Text(
                  "خروج",
                  style: TextStyle(fontSize: 20, color: Color(0xFF6A6A6A)),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
