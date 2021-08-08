import 'package:flutter/material.dart';
import 'package:taswaq/Model/Balance.dart';
import 'package:taswaq/Model/Order.dart';
import 'package:taswaq/Model/User.dart';
import 'package:taswaq/helpers/db_helper.dart';
import '../MyWidget/myButton.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

const double kDefaultPadding = 20.0;

class _RegisterScreenState extends State<RegisterScreen> {
  User user;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate = false;

  void initState() {
    // TODO: implement initState
    if (user != null) {
      userNameController.text = user.username;
      passwordController.text = user.password;
    }
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 204,
                            width: 220,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "انشاء مستخدم",
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
                  padding: const EdgeInsetsDirectional.only(start: 15, end: 10),
                  child: TextField(
                    controller: userNameController,
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
                  padding: const EdgeInsetsDirectional.only(start: 15, end: 10),
                  child: TextField(
                    controller: passwordController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        errorText: validatePassword(passwordController),
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
                  text: "انشاء",
                  color: Color(0xFFFC6011),
                  text_size: 18,
                  text_border_color: Colors.white,
                  onTap: () {
                    setState(() {});
                    _saveUser();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _saveUser() async {
    User user = User(
      username: userNameController.text,
      password: passwordController.text,
    );
    DbHelper.dbHelper.insertUser(user);

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  String validatePassword(TextEditingController value) {
    if (value == null) {
      return "Invalid  input";
    }
    return null;
  }
}
