import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class deleviryRecordsProvider extends ChangeNotifier {
  bool isloading = false;
  List DataMap = [];
  delevryRecordsProvider() {
    GetData();
  }

  GetData() async {
    isloading = true;
    notifyListeners();
    var DataDocument = await Firestore.instance.collection('dilvry').get();
    DataDocument.docs.forEach((element) {
      DataMap.add(element);
    });
    isloading = false;
    notifyListeners();
  }
}
