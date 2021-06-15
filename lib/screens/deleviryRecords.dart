import 'package:admin/providers/deleviryRecordsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DTable extends StatefulWidget {
  DTable({Key key}) : super(key: key);

  @override
  _DTableState createState() => _DTableState();
}

class _DTableState extends State<DTable> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<deleviryRecordsProvider>(
            builder: (context, provider, child) {
          if (provider.isloading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.orange,
                title: Text(
                  "سجلات عمال التوصيل ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Table(
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(50.0),
                          1: FixedColumnWidth(100.0),
                          2: FixedColumnWidth(100.0),
                          3: FixedColumnWidth(100.0),
                          4: FixedColumnWidth(100.0),
                          5: FixedColumnWidth(100.0),
                          6: FixedColumnWidth(100.0),
                        },
                        border: TableBorder.all(
                            color: Colors.orange,
                            width: 1.0,
                            style: BorderStyle.solid),
                        children: const <TableRow>[
                          TableRow(
                            children: <Widget>[
                              Center(
                                  child: Text(
                                'الرقم',
                                style: TextStyle(fontSize: 20),
                              )),
                              Center(
                                  child: Text(
                                'الأسم',
                                style: TextStyle(fontSize: 20),
                              )),
                              Center(
                                  child: Text(
                                'الهاتف',
                                style: TextStyle(fontSize: 20),
                              )),
                              Center(
                                  child: Text(
                                'البريد الألكتروني',
                                style: TextStyle(fontSize: 20),
                              )),
                              Center(
                                  child: Text(
                                'المنطقة ',
                                style: TextStyle(fontSize: 20),
                              )),
                              Center(
                                  child: Text(
                                'تعديل',
                                style: TextStyle(fontSize: 20),
                              )),
                              Center(
                                  child: Text(
                                'حذف',
                                style: TextStyle(fontSize: 20),
                              )),
                            ],
                          ),
                          TableRow(
                            children: <Widget>[
                              Center(
                                  // child:Text(provider.DataMap[0]['userId'],
                                  child: Text(
                                "jbv",
                                style: TextStyle(fontSize: 18),
                              )),
                              Center(
                                  child: Text(
                                'B2',
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
                              Center(
                                  child: IconButton(
                                      icon: Icon(Icons.edit), onPressed: null)),
                              Center(
                                  child: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: null)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        }));
  }
}
