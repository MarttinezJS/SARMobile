import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';


Future<AudioHandler> initAudioService() async {

  return await AudioService.init(
      builder: () => AudioPlayerService(
        url: 'https://points.sigueadelanteradio.com/standard'
      ),
      config: AudioServiceConfig(
        androidNotificationChannelId: 'com.sigue_adelante_radio.stream',
        androidNotificationChannelName: 'Radio online',
        androidNotificationOngoing: true,
        preloadArtwork: true        
      ));
}

class AudioPlayerService extends BaseAudioHandler {
  static final _player = AudioPlayer();

  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  AudioPlayerService({required String url}) {
    loadStream(url);
    _notifyAudioHandlerAboutPlaybackEvents();
  }

  static loadStream(String url) => _player.setUrl(url);

  void _notifyAudioHandlerAboutPlaybackEvents() async {
    _player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = _player.playing;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          if (playing) MediaControl.pause else MediaControl.play,
        ],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_player.processingState]!,
        playing: playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
        queueIndex: event.currentIndex,
      ));
    });
  }

  
  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.stop();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> customAction(String name, [Map<String, dynamic>? extras]) async {
    if (name == 'dispose') {
      await _player.dispose();
      super.stop();
    }
  }

  @override
  Future<void> stop() async {
    await _player.stop();
    return super.stop();
  }
}