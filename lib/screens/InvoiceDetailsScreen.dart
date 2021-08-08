import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taswaq/Model/Order.dart';
import 'package:taswaq/MyWidget/BNP.dart';
import 'package:taswaq/MyWidget/myButton.dart';
import 'package:taswaq/acceptance.dart';
import 'package:taswaq/helpers/db_helper.dart';
import 'package:taswaq/refusal.dart';
import 'package:taswaq/screens/homeScreen.dart';
import 'package:taswaq/screens/ordersScreen.dart';

class InvoiceDetails extends StatefulWidget {
  String userName;
  int id;
  InvoiceDetails({this.id, this.userName});
  @override
  _InvoiceDetailsState createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
  int selectedValue;

  @override
  void initState() {
    super.initState();

    selectedValue = 0;
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller);
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: DbHelper.dbHelper.getSpecificOrder(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Order orders = snapshot.data;
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  backgroundColor: Color(0xFFF6F6F6),
                  appBar: AppBar(
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    actions: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF4A4B4D),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BNP(
                                    id: 1,
                                  )));
                        },
                      ),
                    ],
                    title: Text(
                      "فاتورة  #${orders.id}",
                      style: TextStyle(fontSize: 24, color: Color(0xFF4A4B4D)),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          margin: EdgeInsets.only(bottom: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 35,
                                    ),
                                    width: 220,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${orders.senderName}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFFFC6011)),
                                        ),
                                        Text(
                                          "${orders.senderAddress}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF4A4B4D)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFC6011),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.all(2),
                                      child: Icon(
                                        Icons.place,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF00DD8C),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.all(2),
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                height: 1,
                                color: Color(0xFFDDDDDD),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    // alignment: AlignmentDirectional.centerStart,
                                    margin: EdgeInsets.only(
                                      left: 35,
                                    ),
                                    width: 220,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${orders.receiverName}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFFFC6011)),
                                        ),
                                        Text(
                                          "${orders.receiverAddress}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF4A4B4D)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFC6011),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.all(2),
                                      child: Icon(
                                        Icons.place,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF00DD8C),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.all(2),
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.only(
                              left: 25, right: 25, top: 18, bottom: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "التفاصيل",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF4A4B4D)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${orders.description}",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF757575)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 1,
                                color: Color(0xFFDDDDDD),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "ملاحظة",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFFFC6011)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${orders.notes}",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF757575)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.only(
                              left: 25, right: 25, top: 18, bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "مبلغ الطلبية",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF4A4B4D)),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      " NIS  ${orders.price}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4A4B4D)),
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
                                          fontSize: 15,
                                          color: Color(0xFF4A4B4D)),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      " NIS  ${orders.deliveryFee}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4A4B4D)),
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
                                      "مبلغ الطلبية",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF4A4B4D)),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      " NIS  ${orders.totalFee}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4A4B4D)),
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
                                      "الاجمالي",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF4A4B4D)),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      " NIS  ${orders.totalFee}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFC6011)),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.only(
                              left: 25, right: 25, top: 18, bottom: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MyButton(
                                height: 56,
                                color: Color(0xFFFC6011),
                                text_border_color: Colors.white,
                                text_size: 16,
                                text: "قبول الطلب",
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => BNP(
                                                id: 2,
                                              )),
                                      (route) => false);
                                },
                                // => show1(),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              TextButton(
                                  child: Text(
                                    "رفض الطلب",
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xFF6A6A6A)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => BNP(
                                                  id: 1,
                                                )),
                                        (route) => false);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('error'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  void show() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Refusal();
        });
  }

  void show1() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Acceptance();
        });
  }
}
