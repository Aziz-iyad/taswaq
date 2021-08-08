import 'package:flutter/material.dart';
import 'package:taswaq/Model/Balance.dart';
import 'package:taswaq/Model/Order.dart';
import 'package:taswaq/MyWidget/MyTextField.dart';
import 'package:taswaq/MyWidget/myButton.dart';
import 'package:taswaq/helpers/db_helper.dart';
import 'package:taswaq/screens/adminAllUsers.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  Order order;
  List balance = ['50\$', '100\$', '200\$'];
  String dropDownValue;
  TextEditingController senderController = TextEditingController();
  TextEditingController senderAddressController = TextEditingController();
  TextEditingController receiverController = TextEditingController();
  TextEditingController receiverAddressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController deliveryFeeController = TextEditingController();

  int totalFeeValue() {
    int total;
    String priceString = priceController.text.toString();
    String deliveryString = deliveryFeeController.text.toString();
    var price = int.parse(priceString);
    var delivery = int.parse(deliveryString);
    total = price + delivery;
    return total;
  }

  int balanceId() {
    int x;
    if (dropDownValue == '50\$') {
      x = 1;
    } else if (dropDownValue == '100\$') {
      x = 2;
    } else {
      x = 3;
    }
    return x;
  }

  bool value = true;
  @override
  void initState() {
    // TODO: implement initState

    if (order != null) {
      senderController.text = order.senderName;
      senderAddressController.text = order.senderAddress;
      receiverController.text = order.receiverName;
      receiverAddressController.text = order.receiverAddress;
      descriptionController.text = order.description;
      notesController.text = order.notes;
      priceController.text = order.price;
      deliveryFeeController.text = order.deliveryFee;
    }
  }

  @override
  void dispose() {
    super.dispose();
    senderController.dispose();
    receiverController.dispose();
    descriptionController.dispose();
    notesController.dispose();
    priceController.dispose();
    deliveryFeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        backgroundColor: Color(0xFFFC6011),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AdminAllUsers()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'انشىء طلب توصيل',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              title: "اسم المستلم منه",
              myController: senderController,
            ),
            MyTextField(
              title: "عنوان المستلم منه",
              myController: senderAddressController,
            ),
            MyTextField(
              title: "اسم المرسل اليه",
              myController: receiverController,
            ),
            MyTextField(
              title: "عنوان المرسل اليه",
              myController: receiverAddressController,
            ),
            MyTextField(
              title: "التفاصيل ",
              myController: descriptionController,
            ),
            MyTextField(
              title: "ملاحظة ",
              myController: notesController,
            ),
            MyTextField(
              title: "مبلغ الطلبية ",
              myController: priceController,
              textInputType: TextInputType.number,
            ),
            MyTextField(
              title: "نكلفة التوصيل ",
              myController: deliveryFeeController,
              textInputType: TextInputType.number,
            ),
            Container(
              height: 54,
              margin: EdgeInsets.only(left: 34, right: 34, bottom: 28),
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton(
                isExpanded: true,
                underline: Container(),
                onChanged: (v) {
                  setState(() {});
                  this.dropDownValue = v;
                },
                value: this.dropDownValue,
                hint: Text("حدد رصيد الافتتاحية للعميل"),
                items: balance.map((e) {
                  return DropdownMenuItem<String>(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: MyButton(
                height: 56,
                text: "انشىء",
                color: Color(0xFFFC6011),
                text_size: 18,
                text_border_color: Colors.white,
                onTap: () {
                  setState(() {});
                  _saveOrder();

                  print(totalFeeValue());
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  _saveOrder() async {
    Order order = Order(
      senderName: senderController.text,
      senderAddress: senderAddressController.text,
      receiverName: receiverController.text,
      receiverAddress: receiverAddressController.text,
      price: priceController.text,
      deliveryFee: deliveryFeeController.text,
      description: descriptionController.text,
      notes: notesController.text,
      totalFee: totalFeeValue().toString(),
      balanceId: balanceId(),
    );
    DbHelper.dbHelper.insertOrder(order);
    Navigator.pop(context, "Your order has been saved.");
  }
}
