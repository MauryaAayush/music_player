import 'package:flutter/material.dart';

class VideoplayerScreen extends StatelessWidget {
  const VideoplayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Video Player'),
      ),
    );
  }
}
