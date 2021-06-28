import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChooseDel extends StatefulWidget {

  final String userNameC;
  final String addressC;
  final String  idC;
  final String date;
  final String name;
  final int price;



  ChooseDel({
    this.userNameC,
    this.addressC,
    this.idC,
    this.date,
    this.name,
    this.price,



  });
  @override
  _ChooseDelState createState() => _ChooseDelState();
}

class _ChooseDelState extends State<ChooseDel> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.orange[400],
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
                      document.data()['address'],
                      document.id);
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget item(name,address,id) {
    int count=1;
    return Column(
      children: [
        InkWell(

          onTap: () async {
            await FirebaseFirestore.instance
                .collection('orders')
                .doc()
                .set(({
              'Dname':name ,
              'Daddress': address,
              'DId':id,
              'Cname':widget.userNameC,
              'Caddress':widget.addressC,
              'Cid':widget.idC,
              'date':widget.date,
              'Mname':widget.name,
              'price':widget.price,
              'delevery':false,

            }));
            Navigator.pop(context);

          },
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

          ],
        );

  }
}
