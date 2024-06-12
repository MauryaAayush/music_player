//JSON -> STRING -> MAP/LIST (.DART)

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_player/Screens/Json_Parsing/Provider/dataprovider.dart';
import 'package:provider/provider.dart';

class JsonScreen extends StatelessWidget {
  const JsonScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    DataProviderJson provider = Provider.of<DataProviderJson>(context,listen: true);
    DataProviderJson providerF = Provider.of<DataProviderJson>(context,listen: false);
    log('-------------------- ${provider.dataList.length}');
    return Scaffold(
        appBar: AppBar(
          title: Text('json parsing'),
        ),
        body: ListView.builder(
          itemCount: provider.userList.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              provider.userList[index].name!,
            ),
            subtitle: Text(provider.userList[index].address!.geo!.lat!),



          ),
        ),
    );
  }
}
