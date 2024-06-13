import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Data_test+Provider.dart';

class JsonTestScreen extends StatefulWidget {
  const JsonTestScreen({super.key});

  @override
  State<JsonTestScreen> createState() => _JsonTestScreenState();
}

class _JsonTestScreenState extends State<JsonTestScreen> {
  @override
  void initState() {
    // Fetch data when the widget is initialized
    Provider.of<DataTestProvider>(context, listen: false).jsonParsingdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DataTestProvider provider = Provider.of<DataTestProvider>(context, listen: true);

    log('-------------------- ${provider.postModel?.skip}');

    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Parsing'),
      ),
      body: provider.postModel == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: provider.postModel!.posts!.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            provider.postModel!.posts![index].views!.toString(),
          ),
          subtitle: Text(
            provider.postModel!.posts![index].body!.toString(),
          ),
        ),
      ),
    );
  }
}
