import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/HTTP/Main_Screen.dart';
import 'Screens/Json_Parsing/Provider/dataprovider.dart';

import 'Screens/Music_provider/Music_Provider.dart';
import 'Screens/Testday/Data_test+Provider.dart';
import 'Screens/Wallpaper/Provider/WallPaper_Provider.dart';
import 'Screens/Wallpaper/wallPaper_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataProviderJson dataProviderJson = DataProviderJson();
  runApp(
      MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => MusicProvider(),),
        ChangeNotifierProvider(create: (context) => dataProviderJson,),
        ChangeNotifierProvider(create: (context) => DataTestProvider(),),
        ChangeNotifierProvider(create: (context) => WallpaperProvider(),)
      ],
      child: const MyApp(),)

      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = DataProviderJson();
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: WallpaperScreen(),
      // home: JsonTestScreen(),
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