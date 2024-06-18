import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

class HttPScreen extends StatelessWidget {
  const HttPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('API calling'),
      ),

      body: Center(child: IconButton(onPressed: () {

        ApiServices apiServices = ApiServices();
        apiServices.apiCall();
      }, icon: Icon(Icons.call))),
    );
  }
}


class ApiServices{
  String apiUrl = "https://jsonplaceholder.typicode.com/comments";

  Future<void>  apiCall()
  async {
    Uri url = Uri.parse(apiUrl);
    Response response = await http.get(url);

    if(response.statusCode == 200)
      {
        print('api call successfully');
      }else{
      print("error");
    }

    List l1 = jsonDecode(response.body);

    print(l1[0]);
  }




}