import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:music_player/Screens/Testday/model.dart';

class DataTestProvider extends ChangeNotifier{

  PostModel? postModel;
  Future<void> jsonParsingdata()
  async {
    String? json = await rootBundle.loadString('assets/json/data.json');
    Map data = jsonDecode(json);
    print(data);
    postModel = PostModel.fromJson(data);

    // notifyListeners();
  }
}