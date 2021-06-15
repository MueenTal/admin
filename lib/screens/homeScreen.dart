import 'package:admin/screens/datailsOrders.dart';
import 'package:admin/widgets/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            drawer: Drawer(
              child: Drawerr(),
            ),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.orange,
              title: Text(
                "الصفحة الرئيسية",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('card')
                    .where('confirm', isEqualTo: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return item(
                        document.data()['userName'],
                        document.data()['name'],
                        document.data()['num'],
                        document.id,
                        document.data()['image'],
                        document.data()['address'],
                        document.data()['date'],
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ));
  }

  Widget item(userName, name, number, id, image, address, date) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => DetailsOrders(
                  image: image,
                  name: name,
                  userName: userName,
                  number: number,
                  address: address,
                  date: date,
                )));
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
                      "اسم العميل",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          userName,
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
                      "اسم الوجبة",
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
                      "الكمية",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          number.toString(),
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
    );
  }
}
