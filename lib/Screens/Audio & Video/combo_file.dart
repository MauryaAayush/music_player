import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Screens/Music_provider/Music_Provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen1> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  late VideoPlayerController playerController;
  late ChewieController chewieController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    playerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    );
    playerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: playerController,
    );

    Provider.of<MusicProvider>(context, listen: false).createMusic();
    _assetsAudioPlayer.open(
      Audio("assets/music/music1.mp3"),
      autoStart: false,
    );

    super.initState();
  }

  // @override
  // void dispose() {
  //   _assetsAudioPlayer.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: _assetsAudioPlayer.currentPosition,
              builder: (context, asyncSnapshot) {
                final Duration currentPosition =
                    asyncSnapshot.data ?? Duration.zero;
                return Row(
                  children: [
                    // This for the current duration
                    Text(
                      ' ${currentPosition.toString().split('.').first}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    StreamBuilder(
                      stream: _assetsAudioPlayer.current,
                      builder: (context, asyncSnapshot) {
                        final Playing? current = asyncSnapshot.data;
                        final Duration? totalDuration = current?.audio.duration;
                        return Row(
                          children: [
                            SizedBox(
                              width: 250,
                              child: Slider(
                                value: currentPosition.inSeconds.toDouble(),
                                min: 0,
                                max: totalDuration?.inSeconds.toDouble() ?? 1,
                                onChanged: (value) {
                                  _assetsAudioPlayer
                                      .seek(Duration(seconds: value.toInt()));
                                },
                              ),
                            ),

                            // this for the Total duration
                            Text(
                              totalDuration?.toString().split('.').first ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  iconSize: 64,
                  onPressed: () => _assetsAudioPlayer.play(),
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  iconSize: 64,
                  onPressed: () => _assetsAudioPlayer.pause(),
                ),
              ],
            ),
            AspectRatio(
              aspectRatio: playerController.value.aspectRatio,
              child:Stack(
                children: [
                  Chewie(controller: chewieController),
                  if (!_isVideoPlaying)
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVideoPlaying = true;
                            playerController.play();
                          });
                        },
                        child: Image.asset(
                          'assets/images/Me.jpg', // Replace with your thumbnail image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// Image.asset('assets/images/Me.jpg',fit: BoxFit.cover,)
