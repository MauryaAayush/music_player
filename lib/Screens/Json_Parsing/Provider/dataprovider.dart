import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataProviderJson extends ChangeNotifier
{
//   json -> dart
//  json -> string -> dart
// rootBundle.loadString
// jsonDecode()

List dataList = [];

DataProviderJson(){
  print("**************************");
  jsonParsing();
  print("**************************");
}

Future<void> jsonParsing()
async {
  String? json = await rootBundle.loadString('assets/json/user.json');
  dataList = jsonDecode(json);

  print(dataList);
}
}