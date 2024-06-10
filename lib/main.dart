import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Audio & Video/combo_file.dart';
import 'Screens/Json_Parsing/Provider/dataprovider.dart';
import 'Screens/Json_Parsing/view/MainScreen.dart';
import 'Screens/Music_provider/Music_Provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataProviderJson dataProviderJson = DataProviderJson();
  runApp(
      MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => MusicProvider(),),
        ChangeNotifierProvider(create: (context) => dataProviderJson,)
      ],
      child: const MyApp(),)

      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final provider = DataProviderJson();
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: JsonScreen(),
      // home: VideoplayerScreen(),
    );
  }
}




// JSON : Java Script Object Notation.
// API : Bridge between server and client.
// extension : .json


// import 'package:music_player/Screens/Json/model.dart';
//
// import 'Screens/Json/data.dart';
// import 'data.dart';
//
// void  main()
// {
//   DataModel dataModel = DataModel.fromJson(data[0]);
//
//
//   print(dataModel.name);
//   print(dataModel.age);
//   print(dataModel.address!.Street);
//   print(dataModel.address!.pin);
//   print(dataModel.address!.city);
//   print(dataModel.phone![0].type);
//   print(dataModel.phone![0].number);
//
// }