import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taswaq/ordersScreen.dart';

import 'Model/BNScreen.dart';
import 'MyWidget/myButton.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(height: 353),
                  Container(
                    height: 247,
                    color: Color(0xFFFC6011),
                  ),
                  Positioned(
                    top: 32,
                    right: 0,
                    left: 0,
                    child: Text(
                      "تسوق دليفرى",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 113,
                    right: 21,
                    left: 21,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 28,
                            ),
                            Text(
                              "إبدا العمل الآن",
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xFF4A4B4D)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("اضغط بدء العمل لتبدا  ساعات عملك",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF4A4B4D))),
                            SizedBox(
                              height: 37,
                            ),
                            MyButton(
                              height: 50,
                              text: "بدء العمل",
                              color: Colors.white,
                              text_size: 20,
                              text_border_color: Color(0xFFFC6011),
                              onTap: () {
                                showAppDialog("opening_balance");
                              },
                            ),
                            SizedBox(
                              height: 32,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFFDC349),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 28,
                            ),
                            Text(
                              "رصيد المكتب |  الكومشن",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF330507)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("33 NIS",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF330507))),
                            SizedBox(
                              height: 21,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 33,
                    ),
                    Text(
                      "الطلبات لهذا اليوم",
                      style: TextStyle(fontSize: 18, color: Color(0xFF4A4B4D)),
                      textAlign: TextAlign.start,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/details');
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "اسم المستلم منه",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFFC6011)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 235,
                                    child: Text(
                                        "غزة شارع الجلاء مقابل صيدلية مسلم عمارة حمد شقة 5",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF330507))),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Divider(
                                    color: Color(0xFF707070),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "الرقم |  #35411",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF6A6A6A)),
                                      )),
                                      Expanded(
                                        child: MyButton(
                                          height: 40,
                                          text: "التفاصيل",
                                          color: Color(0xFFFC6011),
                                          text_size: 14,
                                          text_border_color: Colors.white,
                                          onTap: () {
                                            showAppDialog("new_order");
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAppDialog(String x) async {
    String userName = await showDialog<String>(
      context: context,
      builder: (context) {
        switch (x) {
          case "new_order":
            return Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                contentPadding:
                    EdgeInsets.only(left: 32, right: 32, bottom: 45),
                title: Text(
                  "لديك طلب جديد",
                  style: TextStyle(fontSize: 24, color: Color(0xFF4A4B4D)),
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "اضغط موافق وتوجهه لاستلام طلبك",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Color(0xFF4A4B4D)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "اسم المستلم منه",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Color(0xFFFC6011)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 235,
                      child: Text(
                          "غزة شارع الجلاء مقابل صيدلية مسلم عمارة حمد شقة 5",
                          style: TextStyle(
                              fontSize: 16, color: Color(0xFF330507))),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    MyButton(
                      height: 50,
                      text: "موافق",
                      color: Color(0xFFFC6011),
                      text_size: 20,
                      text_border_color: Colors.white,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
            break;

          case "opening_balance":
            return Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                contentPadding:
                    EdgeInsets.only(left: 32, right: 32, bottom: 45),
                title: Text(
                  "رصيد الافتتاحية",
                  style: TextStyle(fontSize: 24, color: Color(0xFF4A4B4D)),
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ادخل المبلغ المتوفر معك لبدء العمل",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Color(0xFF4A4B4D)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      cursorColor: Color(0xFFFC6011),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFFBBBBBB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFFFC6011),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 43,
                    ),
                    MyButton(
                      height: 50,
                      text: "موافق",
                      color: Color(0xFFFC6011),
                      text_size: 20,
                      text_border_color: Colors.white,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
            break;

          default:
            return null;
        }
      },
    );
  }
}
