import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class MealRecordsProvider extends ChangeNotifier {
  bool isloading = false;
  List DataMap = [];
  MealRecordsProvider() {
    GetData();
  }
  GetData() async {
    isloading = true;
    notifyListeners();
    var DataDocument = await Firestore.instance.collection('items').get();
    DataDocument.docs.forEach((element) {
      DataMap.add(element);
    });
    isloading = false;
    notifyListeners();
  }
}
