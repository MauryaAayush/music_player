import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player/Screens/Json/data.dart';
import 'package:music_player/Screens/Json/model.dart';

import '../model/data_model.dart';

class DataProviderJson extends ChangeNotifier {
//   json -> dart
//  json -> string -> dart
// rootBundle.loadString
// jsonDecode()

  List dataList = [];
  List<DataModel> userList = [];

  DataProviderJson() {
    print("**************************");
    jsonParsing();
    print("**************************");
  }

  Future<void> jsonParsing() async {
    String? json = await rootBundle.loadString('assets/json/user.json');
    dataList = jsonDecode(json);

    userList = dataList
        .map(
          (e) => DataModel.fromJson(e),
    )
        .toList();

    // fromList();

    print(userList);
    notifyListeners();
  }

  // void fromList() {
  //   // DataModel.fromJson(dataList[0]);
  //
  //
  //   // notifyListeners();
  // }
}
