import 'package:flutter/material.dart';

class DetailsOrders extends StatefulWidget {
  final String image;
  final String userName;
  final String address;

  final String name;
  final String date;

  final int number;

  DetailsOrders(
      {this.image,
      this.name,
      this.number,
      this.userName,
      this.address,
      this.date});
  @override
  _DetailsOrdersState createState() => _DetailsOrdersState();
}

class _DetailsOrdersState extends State<DetailsOrders> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.lightBlue[800],
            title: Text(
              "تفاصيل الطلب",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
                        widget.userName,
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
                        widget.name,
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
                        widget.number.toString(),
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
                        widget.address,
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
                    "وقت الطلب",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        widget.date,
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
      ),
    );
  }
}
