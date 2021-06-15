import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerRecordsProvider extends ChangeNotifier {
  bool isloading = false;
  List DataMap = [];
  CustomerRecordsProvider() {
    GetData();
  }
  GetData() async {
    isloading = true;
    notifyListeners();
    var DataDocument = await Firestore.instance.collection('users').get();
    DataDocument.docs.forEach((element) {
      DataMap.add(element);
    });
    isloading = false;
    notifyListeners();
  }
}
