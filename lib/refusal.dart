import 'package:flutter/material.dart';

import 'MyWidget/myButton.dart';

class Refusal extends StatefulWidget {
  @override
  _RefusalState createState() => _RefusalState();
}

class _RefusalState extends State<Refusal> {

  int selectedValue ;

  @override
  void initState() {
    super.initState();
    selectedValue = 0;
  }

  setSelectedRadio(int val){
    setState(() {
      selectedValue = val;
    });
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
                  Text("اكتب سبب الرفض", style: TextStyle(
                      fontSize: 18, color: Color(0xFF4A4B4D)),),
                  SizedBox(height: 18,),
                  Divider(
                    color: Color(0xFF707070),
                  ),
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Color(0xFFF6F6F6),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("لا يوحد بنزين", style: TextStyle(
                                  fontSize: 16, color: Color(0xFF2D2D2D)),),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Radio(
                                activeColor: Color(0xFFFC6011),
                                value: 1,
                                groupValue: selectedValue,
                                onChanged: (int value) {
                                  setSelectedRadio(value);
                                },),
                              alignment: Alignment.centerLeft,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Color(0xFFF6F6F6),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("مشكلة في الفزبة", style: TextStyle(
                                  fontSize: 16, color: Color(0xFF2D2D2D)),),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Radio(
                                activeColor: Color(0xFFFC6011),
                                value: 2,
                                groupValue: selectedValue,
                                onChanged: (int value) {
                                  setSelectedRadio(value);
                                },),
                              alignment: Alignment.centerLeft,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Color(0xFFF6F6F6),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("لدي مشوار اخر", style: TextStyle(
                                  fontSize: 16, color: Color(0xFF2D2D2D)),),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Radio(
                                activeColor: Color(0xFFFC6011),
                                value: 3,
                                groupValue: selectedValue,
                                onChanged: (int value) {
                                  setSelectedRadio(value);
                                },),
                              alignment: Alignment.centerLeft,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Color(0xFFF6F6F6),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("امر طارئ", style: TextStyle(
                                  fontSize: 16, color: Color(0xFF2D2D2D)),),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Radio(
                                activeColor: Color(0xFFFC6011),
                                value: 4,
                                groupValue: selectedValue,
                                onChanged: (int value) {
                                  setSelectedRadio(value);
                                },),
                              alignment: Alignment.centerLeft,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Container(
                    width: double.infinity,
                    child: Text("لدي سبب اخر !", style: TextStyle(
                        fontSize: 16, color: Color(0xFF2D2D2D)),textAlign: TextAlign.start,),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    maxLines: 3,
                    cursorColor: Color(0xFFFC6011),
                    decoration: InputDecoration(
                      hintText: "اكتب سبب الرفض",
                      helperStyle: TextStyle(fontSize: 14,color: Color(0xFF6A6A6A)),
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
                  SizedBox(height: 75,),
                  MyButton(height: 56, color: Color(0xFFFC6011), text_border_color: Colors.white, text_size: 16, text: "ارسل"),
                  SizedBox(height: 30,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
