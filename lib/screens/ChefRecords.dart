import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("Table Widget"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(50.0),
                1: FixedColumnWidth(100.0),
                2: FixedColumnWidth(50.0),
                3: FixedColumnWidth(100.0),
              },
              border: TableBorder.all(
                  color: Colors.orange, width: 1.0, style: BorderStyle.solid),
              children: const <TableRow>[
                TableRow(
                  children: <Widget>[
                    Center(
                        child: Text(
                      'A1',
                      style: TextStyle(fontSize: 18),
                    )),
                    Center(
                        child: Text(
                      'B1',
                      style: TextStyle(fontSize: 18),
                    )),
                    Center(
                        child: Text(
                      'C1',
                      style: TextStyle(fontSize: 18),
                    )),
                    Center(
                        child: Text(
                      'D1',
                      style: TextStyle(fontSize: 18),
                    )),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Center(
                        child: Text(
                      'A2',
                      style: TextStyle(fontSize: 18),
                    )),
                    Center(
                        child: Text(
                      'B2',
                      style: TextStyle(fontSize: 18),
                    )),
                    Center(
                        child: Text(
                      'C2',
                      style: TextStyle(fontSize: 18),
                    )),
                    Center(
                        child: Text(
                      'D2',
                      style: TextStyle(fontSize: 18),
                    )),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Center(
                        child: Text(
                      'A3',
                      style: TextStyle(fontSize: 18),
                    )),
                    Center(
                        child: Text(
                      'B3',
                      style: TextStyle(fontSize: 18),
                    )),
                    Center(
                        child: Text(
                      'C3',
                      style: TextStyle(fontSize: 18),
                    )),
                    Center(
                        child: Text(
                      'D3',
                      style: TextStyle(fontSize: 18),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
