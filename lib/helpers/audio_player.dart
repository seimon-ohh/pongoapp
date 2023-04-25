import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioPlayer extends StatefulWidget {
  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _playSong();
  }

  void _playSong() {
    _assetsAudioPlayer.open(
      Audio("assets/audio/Cool Chiptune 8 Bit Background Music for Videos  No Copyright.mp3"),
    );

    _assetsAudioPlayer.play();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Playing song from assets');
  }
}