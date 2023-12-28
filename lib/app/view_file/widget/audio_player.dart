// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String url;

  const AudioPlayerWidget({super.key, required this.url});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration();
  Duration position = Duration();
  bool loading = false;
  bool playing = false;

  @override
  void initState() {
    super.initState();

    audioPlayer.onDurationChanged.listen((Duration ddd) {
      if (mounted) {
        setState(() {
          duration = ddd;
        });
      }
    });

    audioPlayer.onPositionChanged.listen((Duration dd) {
      if (mounted) {
        setState(() => position = dd);
      }
    });

    handelAudio();
  }

  handelAudio() async {
    if (playing) {
      await audioPlayer.pause();
      setState(() => playing = false);
    } else {
      await audioPlayer.play(UrlSource(widget.url));
      setState(() => playing = true);
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/mp3.png',
          width: 64,
          height: 64,
        ),
        40.heightBox,
        Slider.adaptive(
          min: 0.0,
          value: duration.inSeconds > 0
              ? position.inSeconds
                  .clamp(0.0, duration.inSeconds.toDouble())
                  .toDouble()
              : 0.0,
          max: duration.inSeconds.toDouble(),
          onChanged: (double value) {
            log(duration.toString());
            setState(() => audioPlayer.seek(Duration(seconds: value.toInt())));
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                audioPlayer.seek(Duration(seconds: position.inSeconds - 10));
              },
              icon: const Icon(
                Icons.fast_rewind_rounded,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {
                handelAudio();
              },
              icon: Icon(
                playing == false
                    ? Icons.play_circle
                    : Icons.pause_circle_filled,
                size: 56,
              ),
            ),
            IconButton(
              onPressed: () {
                audioPlayer.seek(Duration(seconds: position.inSeconds + 10));
              },
              icon: const Icon(
                Icons.fast_forward_rounded,
                size: 32,
              ),
            ),
          ],
        )
      ],
    );
  }
}
