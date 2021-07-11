import 'package:flutter/material.dart';

import 'MyWidget/myButton.dart';

class Acceptance extends StatefulWidget {
  @override
  _AcceptanceState createState() => _AcceptanceState();
}

class _AcceptanceState extends State<Acceptance> {

  bool checked ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.close), onPressed: (){
              Navigator.pop(context);
            }),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                children: [
                  Image.asset('assets/images/Group.png',),
                  Text("تأكيد استلام المنتج", style: TextStyle(
                      fontSize: 26, color: Color(0xFF4A4B4D)),),
                  SizedBox(height: 25,),
                  Text("سعر المنتجات", style: TextStyle(
                      fontSize: 17, color: Color(0xFF4A4B4D)),),
                  SizedBox(height: 5,),
                  Text("المبلغ الذي تم دفعه ثمن المنتجات", style: TextStyle(
                      fontSize: 15, color: Color(0xFF6A6A6A)),),
                  SizedBox(height: 15,),
                  TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24,color: Color(0xFF6A6A6A)),
                    cursorColor: Color(0xFFFC6011),
                    decoration: InputDecoration(
                      suffix: Text("NIS", style: TextStyle(
                          fontSize: 20, color: Color(0xFF6A6A6A)),),
                      hintText: "00:00",
                      hintStyle: TextStyle(fontSize: 24,color: Color(0xFF6A6A6A)),
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
                  SizedBox(height: 27,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor: Color(0xFFFC6011),
                        value: checked,
                        onChanged:(bool value){
                          setState(() {
                            checked = value;
                          });
                        },
                      ),
                      Text("فى حال لم تدفع سعر المنتجات حدد هذا الخيار", style: TextStyle(
                          fontSize: 14, color: Color(0xFFFC6011)),),
                    ],
                  ),
                  SizedBox(height: 65,),
                  MyButton(height: 56, color: Color(0xFFFC6011), text_border_color: Colors.white, text_size: 16, text: "تأكيد"),
                  SizedBox(height: 65,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
