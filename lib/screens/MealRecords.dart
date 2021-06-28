import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MRecord extends StatefulWidget {
  @override
  _MRecordState createState() => _MRecordState();
}

class _MRecordState extends State<MRecord> {
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
              "سجلات الوجبات",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('items')
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
                      document.data()['price'],
                      document.data()['tyep'],
                      document.data()['starts'],
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

  Widget item(name, price, tyep, rating, docId, id) {
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
                          "السعر ",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              price.toString(),
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
                          "القسم",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              tyep.toString(),
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
                          "التقييم",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              rating.toString(),
                              style: TextStyle(color: Colors.black, fontSize: 20),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
