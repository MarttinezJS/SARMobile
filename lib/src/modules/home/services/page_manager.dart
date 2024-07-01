import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/service_locator.dart';

class PageManager {
  final playButtonNotifier = PlayButtonNotifier();
  final _audioHandler = getIt<AudioHandler>();
  
  void init() async {
    _listenToPlaybackState();
    final mediaItem = MediaItem(
      id: '1',
      title: 'Radio online',
      artist: 'Sigue Adelante Radio',
      artUri: Uri.file('assets/imgs/Logo-Sigue-Adelante-Header-1-1-scaled.jpg')
    );
    _audioHandler.addQueueItems([mediaItem]);
  }

  void _listenToPlaybackState() {
    _audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != AudioProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        _audioHandler.seek(Duration.zero);
        _audioHandler.pause();
      }
    });
  }

  void play() => _audioHandler.play();
  void pause() => _audioHandler.pause();
  void stop() => _audioHandler.stop();

  void dispose() {
    _audioHandler.customAction('dispose');
  }

}


class PlayButtonNotifier extends ValueNotifier<ButtonState> {
  PlayButtonNotifier() : super(_initialValue);
  static const _initialValue = ButtonState.paused;
}

enum ButtonState {
  paused,
  playing,
  loading,
}
