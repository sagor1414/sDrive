import 'package:flutter/material.dart';
import 'package:sdrive/app/widgets/loading_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  const VideoPlayerWidget({super.key, required this.url});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    videoPlayerController = VideoPlayerController.network(widget.url);
    videoPlayerController.initialize().then((value) {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
      );
      initialized = true;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: initialized
          ? Chewie(controller: chewieController)
          : Center(
              child: Loadingindicator(color: Colors.deepOrangeAccent),
            ),
    );
  }
}
