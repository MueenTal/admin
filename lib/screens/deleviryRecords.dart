import 'package:admin/screens/editDel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DRecord extends StatefulWidget {
  @override
  _DRecordState createState() => _DRecordState();
}

class _DRecordState extends State<DRecord> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.yellow[800],
            title: Text(
              "سجلات العمال",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('dilvery')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              return new ListView(
                children:
                snapshot.data.documents.map((DocumentSnapshot document) {
                  return item(
                      document.data()['name'],
                      document.data()['email'],
                      document.data()['phone'],
                      document.data()['address'],
                      document.data()['docId'],
                      document.id);
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget item(name, email, phone,address, docId, id) {
    return Column(
      children: [
        InkWell(

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange[200],
                  ),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          " الاسم",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              name,
                              style: TextStyle(color: Colors.black, fontSize: 20),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ]),
                      Row(children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "الايميل ",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              email,
                              style: TextStyle(color: Colors.black, fontSize: 20),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ]),
                      Row(children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "الهاتف",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              phone.toString(),
                              style: TextStyle(color: Colors.black, fontSize: 20),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ]),
                      Row(children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "العنوان",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                             address,
                              style: TextStyle(color: Colors.black, fontSize: 20),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ]),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('dilvery')
                      .doc(id)
                      .delete();
                  Fluttertoast.showToast(
                      msg: "تم حذف العامل بنجاح",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }),
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: (){Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => EditDel(
                        name:name,
                        email:email,
                        phone:phone,
                        address:address,
                        id:id
                    )));}
            )
          ],
        )
      ],
    );
  }
}
