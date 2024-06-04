import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Music_provider/Music_Provider.dart';
import 'Screens/Video_Player/videoplayer.dart';
import 'Screens/home/home_screen.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => MusicProvider(),)
      ],
      child: const MyApp(),)

      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // home: HomeScreen(),
      home: VideoplayerScreen(),
    );
  }
}


