import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDilivery extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddDilivery> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _address = TextEditingController();
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.orange,
                  title: Text(
                    "إضافة عامل توصيل",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextField(
                                    controller: _name,
                                    decoration: InputDecoration(
                                      hintText: 'الرجاء ادخال الاسم    ',
                                      labelText: 'الاسم',
                                      prefixIcon: Icon(Icons.person),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 3),
                                        borderRadius:
                                            BorderRadius.circular((25)),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextField(
                                    controller: _email,
                                    decoration: InputDecoration(
                                      hintText: 'الرجاء ادخال الايميل  ',
                                      labelText: 'الايميل',
                                      prefixIcon: Icon(Icons.email),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 3),
                                        borderRadius:
                                            BorderRadius.circular((25)),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextField(
                                    controller: _password,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'الرجاء ادخال كلمة المرور',
                                      labelText: 'كلمة المرور',
                                      prefixIcon: Icon(Icons.vpn_key),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 3),
                                        borderRadius:
                                            BorderRadius.circular((25)),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: _phone,
                                    decoration: InputDecoration(
                                      hintText: 'الرجاء ادخال رقم الهاتف    ',
                                      labelText: 'رقم الهاتف',
                                      prefixIcon: Icon(Icons.phone),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 3),
                                        borderRadius:
                                            BorderRadius.circular((25)),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextField(
                                    controller: _address,
                                    decoration: InputDecoration(
                                      hintText: 'الرجاء ادخال المنطقة  ',
                                      labelText: 'المنطقة',
                                      prefixIcon: Icon(Icons.place),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 3),
                                        borderRadius:
                                            BorderRadius.circular((25)),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.orange[300],
                                              Colors.orange[500],
                                            ])),
                                    child: FlatButton(
                                        splashColor: Colors.orange[200],
                                        child: Text(
                                          "إضافة ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () async {
                                          // التحقق من المتغيرات كلها معبئة ام لا
                                          if (_name.text.isEmpty ||
                                              _email.text.isEmpty ||
                                              _password.text.isEmpty ||
                                              _phone.text.isEmpty) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "يجب عليك ادخال جميع المطاليب  ",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          } else {
                                            try {
                                              setState(() {
                                                load = true;
                                              });
                                              //انشاء حساب بواسطة الايميل كلمة المرور
                                              UserCredential userCredential =
                                                  await FirebaseAuth.instance
                                                      .createUserWithEmailAndPassword(
                                                          email: _email.text,
                                                          password:
                                                              _password.text);
                                              // اضافة معلومات عامل التوصيل الى جدول عامل التوصيل
                                              await FirebaseFirestore.instance
                                                  .collection('dilvery')
                                                  .doc(userCredential.user.uid)
                                                  .set(({
                                                    'name': _name.text,
                                                    'email': _email.text,
                                                    'phone': _phone.text,
                                                    'address': _address.text,
                                                    'userId':
                                                        userCredential.user.uid
                                                  }));
                                              // تغيير الاسم الخاص به الى دليفيري ليتم التحقق عند الدخول بالتطبيق الخاص به
                                              await userCredential.user
                                                  .updateProfile(
                                                      displayName: "dilvery");

                                              Fluttertoast.showToast(
                                                  msg:
                                                      " تم تسجيل عامل التوصيل بنجاح",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.green,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                              Navigator.pop(context);

                                              setState(() {
                                                load = false;
                                              });
                                            } catch (e) {
                                              setState(() {
                                                load = false;
                                              });
                                              print(e);
                                              // طباعة الاخطاء الواردة من الفير بيز

                                              if (e
                                                  .toString()
                                                  .contains("invalid-email")) {
                                                Fluttertoast.showToast(
                                                    msg: "خطا في ادخال الايميل",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              } else if (e
                                                  .toString()
                                                  .contains("weak-password")) {
                                                Fluttertoast.showToast(
                                                    msg: "كلمة المرور ضعيفة",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              } else if (e.toString().contains(
                                                  "email-already-in-use")) {
                                                Fluttertoast.showToast(
                                                    msg: "هذا الايميل مستخدم",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              } else {
                                                print("");
                                              }
                                            }
                                          }
                                        }),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      load
                          ? Center(
                              child: Container(
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ))));
  }
}
