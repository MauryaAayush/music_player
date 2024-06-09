import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Screens/Music_provider/Music_Provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  void initState() {
    Provider.of<MusicProvider>(context, listen: false).createMusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MusicProvider musicProviderTrue =
        Provider.of<MusicProvider>(context, listen: true);
    MusicProvider musicProviderFalse =
        Provider.of<MusicProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Music App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  musicProviderFalse.assetsAudioPlayer!.pause();
                },
                icon: Icon(Icons.pause)),
            IconButton(
                onPressed: () {
                  musicProviderFalse.assetsAudioPlayer!.play();
                },
                icon: Icon(Icons.play_circle)),
          ],
        ),
      ),
    );
  }
}

//Asset
