import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String title;
  TextEditingController myController;
  TextInputType textInputType;
  MyTextField(
      {@required this.title, @required this.myController, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 56,
      margin: EdgeInsets.only(left: 34, right: 34, bottom: 28),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 15, end: 10),
        child: TextField(
          keyboardType: textInputType,
          controller: myController,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: title),
        ),
      ),
    );
  }
}
