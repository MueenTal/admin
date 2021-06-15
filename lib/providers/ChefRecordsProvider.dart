import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ChefRecordsProvider extends ChangeNotifier {
  bool isloading = false;
  List DataMap = [];
  ChefRecordsProvider() {
    GetData();
  }
  GetData() async {
    isloading = true;
    notifyListeners();
    var DataDocument = await Firestore.instance.collection('chefs').get();
    DataDocument.docs.forEach((element) {
      DataMap.add(element);
    });
    isloading = false;
    notifyListeners();
  }
}
