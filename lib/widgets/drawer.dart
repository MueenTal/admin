import 'package:admin/screens/AddDilvery.dart';
import 'package:admin/screens/addChef.dart';
import 'package:flutter/material.dart';

class Drawerr extends StatefulWidget {
  @override
  _DrawerrState createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Colors.lightBlue[600],
              Colors.lightBlue[700],
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
