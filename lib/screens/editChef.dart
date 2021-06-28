import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditChef extends StatefulWidget {
 final String name;
 final String email;
 final String phone;
 final String docId;
 final String  id;

 EditChef({
   this.name,
   this.email,
   this.phone,
   this.docId,
   this.id
});
  @override
  _EditChefState createState() => _EditChefState();
}

class _EditChefState extends State<EditChef> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

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
                    "تعديل طباخ",
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
                              Row(children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  widget.name,
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                ),]),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextField(
                                    controller: _name,
                                    decoration: InputDecoration(
                                      hintText: 'الرجاء ادخال الاسم الخاص بك  ',
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
                              Row(children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  widget.email,
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                ),]),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextField(
                                    controller: _email,
                                    decoration: InputDecoration(
                                      hintText: 'الرجاء ادخال الايميل الخاص بك',
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
                              Row(children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'ادخال كلمة المرور الجديدة',
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                ),]),
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
                              Row(children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  widget.phone,
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                ),]),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: _phone,
                                    decoration: InputDecoration(
                                      hintText:
                                          'الرجاء ادخال رقم الهاتف الخاص بك  ',
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
                                          "تعديل ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () async {

                                          if (_name.text.isEmpty ||
                                              _email.text.isEmpty ||
                                              _phone.text.isEmpty ||_password.text.isEmpty) {

                                            Fluttertoast.showToast(
                                                msg: " يجب ملئ جميع الحقول المطلوبة",
                                                toastLength:
                                                Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.green,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }

                                          else {
                                            try {
                                              setState(() {
                                                load = true;
                                              });
                                              String id=widget.id;
                                              await FirebaseFirestore.instance
                                                  .collection('chefs')
                                                  .doc(id)
                                                  .update(({
                                                    'name': _name.text,
                                                    'email': _email.text,
                                                    'phone': _phone.text,

                                                  }));
                                                User user =
                                                await FirebaseAuth.instance
                                                    .currentUser;
                                                await user.updatePassword(
                                                    _password.text);


                                              Fluttertoast.showToast(
                                                  msg: " تم التعديل بنجاح",
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
                                              }  else {
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
