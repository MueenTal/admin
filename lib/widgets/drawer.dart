import 'package:admin/screens/AddDilvery.dart';
import 'package:admin/screens/CustomerRecords.dart';
import 'package:admin/screens/MealRecords.dart';
import 'package:admin/screens/addChef.dart';
import 'package:admin/screens/ChefRecords.dart';
import 'package:admin/screens/deleviryRecords.dart';
import 'package:admin/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Drawerr extends StatefulWidget {
  @override
  _DrawerrState createState() => _DrawerrState();
}

// القائمة الجانبية التي ستفتح من الجنب
class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Colors.orange[300],
              Colors.orange,
            ])),
            child: Container(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    child: Image.asset(
                      "assets/images/admin.png",
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    'الأدمن ',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                )
              ],
            ))),
        CustomListTitle(Icons.add, "إضافة طباخ", () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => AddChef()));
        }),
        CustomListTitle(Icons.add, "إضافة عامل توصيل", () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddDilivery()));
        }),
        CustomListTitle(Icons.person, "سجلات الطباخين", () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => ChRecord()));
        }),
        CustomListTitle(Icons.person, "سجلات عمال التوصيل", () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => DRecord()));
        }),
        CustomListTitle(Icons.person, "سجلات الزبائن", () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => CRecord()));
        }),
        CustomListTitle(Icons.person, "سجلات الوجبات", () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => MRecord()));
        }),
        CustomListTitle(
            Icons.logout,"تسجيل الخروج",
                () async {
              await FirebaseAuth.instance.signOut();
              Fluttertoast.showToast(
                  msg: "تم تسجيل الخروج بنجاح",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => Login()));
            }
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class CustomListTitle extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTitle(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: InkWell(
          splashColor: Colors.blue[300],
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(
                    icon,
                    size: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
                Icon(
                  Icons.arrow_right,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
