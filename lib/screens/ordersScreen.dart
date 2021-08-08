import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taswaq/Model/Order.dart';
import 'package:taswaq/MyWidget/BNP.dart';
import 'package:taswaq/helpers/db_helper.dart';
import 'package:taswaq/screens/homeScreen.dart';

import '../MyWidget/myButton.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFFFC6011),
          title: Text(
            "طلبات اليوم",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<Order>>(
                future: DbHelper.dbHelper.getAllOrders(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<Order> orders = snapshot.data;
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 0.3,
                                blurRadius: 0.3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          width: double.infinity,
                          height: 45,
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "عدد الطلبات (${orders.length})",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFF4A4B4D)),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "23-6-2021",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFFA6A6A6)),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffDDDDDD),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        orders[index].senderName,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFFFC6011)),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "اجمالي الطلب",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF330507)),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              " NIS  |  ${orders[index].price}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF330507)),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "تكلفة التوصيل",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF330507)),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              " NIS  |   ${orders[index].deliveryFee}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF330507)),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "المبلغ الاجمالي",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF330507)),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              " NIS  |   ${orders[index].totalFee}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF330507)),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        height: 1,
                                        color: Color(0xFFDDDDDD),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "3:15 |  وقت التسليم ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF6A6A6A)),
                                          )),
                                          Expanded(
                                            child: MyButton(
                                              height: 40,
                                              text: "تم التسليم",
                                              color: Color(0xFF00DD8C),
                                              text_size: 14,
                                              text_border_color: Colors.white,
                                              onTap: () {},
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
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('error'));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
