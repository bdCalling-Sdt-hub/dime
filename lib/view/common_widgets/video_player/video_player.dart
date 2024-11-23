import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late FlickManager flickManager;

  bool isLoading = true;

  @override
  void initState() {
    try{
      flickManager = FlickManager(
          videoPlayerController:
          VideoPlayerController.networkUrl(Uri.parse(""),
          ));
    }catch(e){
      print("<=====>>><<<=====>>><<<=====>$e");
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlickVideoPlayer(flickManager: flickManager),
    );
  }
}