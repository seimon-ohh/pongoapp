import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioPlayer extends StatefulWidget {
  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  bool _isMuted = false;
  @override
  void initState() {
    _playSong();
    super.initState();
  }


  void _playSong() {
    _assetsAudioPlayer.open(
      Audio("assets/audio/Cool Chiptune 8 Bit Background Music for Videos  No Copyright.mp3"),
      loopMode: LoopMode.single
    );

    _assetsAudioPlayer.play();

  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _assetsAudioPlayer.setVolume(_isMuted ? 0 : 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}