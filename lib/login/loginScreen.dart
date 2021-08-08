import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:taswaq/Model/Balance.dart';
import 'package:taswaq/Model/Order.dart';
import 'package:taswaq/Model/User.dart';
import 'package:taswaq/helpers/db_helper.dart';
import 'package:taswaq/screens/welcomeScreen.dart';

import '../MyWidget/myButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

const double kDefaultPadding = 20.0;

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String username, _password;
  String aziz = 'test';
  bool _validate = false;

  submit() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      String globalUserName = username;
      User myUser = await DbHelper.dbHelper.getSpecificUser(username);
      if (myUser.username == username) {
        _validate = false;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WelcomeScreen(
                  userName: username,
                )));
        print(myUser.toMap());
      } else {
        _validate = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: kDefaultPadding * 2.3),
                  height: size.height * 0.4,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.height * 0.4 - 60,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            )),
                        child: Image.asset(
                          'assets/images/BackgroundObjects.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          left: 0,
                          bottom: 0,
                          //بتقدر من هان تنزل الدائرة اكتر او اقل
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/admin');
                            },
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/images/logo.png',
                                height: 204,
                                width: 220,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "تسجيل دخول",
                  style: TextStyle(fontSize: 30, color: Color(0xFF4A4B4D)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 56,
                  margin: EdgeInsets.only(left: 34, right: 34, bottom: 28),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 15, end: 10),
                    child: TextFormField(
                      onSaved: (val) => username = val,
                      validator: (String v) {
                        if (v.length == 0) {
                          return 'Requierd filed';
                        }
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          hintStyle:
                              TextStyle(fontSize: 14, color: Color(0xFFB6B7B7)),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "اسم المستخدم"),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 56,
                  margin: EdgeInsets.only(left: 34, right: 34, bottom: 28),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 15, end: 10),
                    child: TextFormField(
                      onSaved: (val) => _password = val,
                      validator: (String v) {
                        if (v.length == 0) {
                          return 'Requierd filed';
                        } else if (v.length < 3) {
                          return 'The password must be larger than 3 letters';
                        }
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 14, color: Color(0xFFB6B7B7)),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "كلمة المرور"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  child: MyButton(
                      height: 56,
                      text: "دخول",
                      color: Color(0xFFFC6011),
                      text_size: 18,
                      text_border_color: Colors.white,
                      onTap: () {
                        submit();
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'أنشِئ حسابًا ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFC6011),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
