import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoplayerScreen extends StatefulWidget {
  const VideoplayerScreen({super.key});

  @override
  State<VideoplayerScreen> createState() => _VideoplayerScreenState();
}

class _VideoplayerScreenState extends State<VideoplayerScreen> {
  late VideoPlayerController videoPlayerController;
  late VideoPlayerController playerController;
  late ChewieController chewieController;

  // to initialize video in controller.
  @override
  void initState() {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    );
    videoPlayerController.initialize();

    playerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    );
    playerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: playerController,
    );


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Video Player'),
          leading: Icon(Icons.menu),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: VideoPlayer(
                  videoPlayerController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AspectRatio(
                aspectRatio: playerController.value.aspectRatio,
                child: Chewie(controller: chewieController),
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  videoPlayerController.play();
                },
                icon: Icon(Icons.play_circle)),
            IconButton(
                onPressed: () {
                  videoPlayerController.pause();
                },
                icon: Icon(Icons.pause_circle))
          ],
        ));
  }

}
