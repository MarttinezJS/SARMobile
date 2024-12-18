import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/service_locator.dart';

class PageManager {
  final playButtonNotifier = PlayButtonNotifier();
  final _audioHandler = getIt<AudioHandler>();
  final progressData = ProgressData();

  void init() async {
    _listenToPlaybackState();
    final artUri = (Uri.parse('https://sigueadelanteradio.com/logo.svg'));
    final mediaItem = MediaItem(
      id: '1',
      title: 'Radio online',
      artist: 'Sigue Adelante Radio',
      artUri: artUri
    );
    _audioHandler.addQueueItems([mediaItem]);
  }

  void _listenToPlaybackState() {
    _audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      progressData.value = {
        'currentTime': playbackState.position,
        'buffer': playbackState.bufferedPosition
      };
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

  void play() {
    playButtonNotifier.value = ButtonState.loading;
    _audioHandler.play();
  }
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

class ProgressData extends ValueNotifier<Map<String, Duration>> {
  ProgressData() : super({});

}

enum ButtonState {
  paused,
  playing,
  loading,
}
