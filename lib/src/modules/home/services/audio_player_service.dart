import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/mount_points_service.dart';

Future<AudioHandler> initAudioService() async {

  final points = await MountPointsService.getPoints();
  return await AudioService.init(
      builder: () => AudioPlayerService(
        url: points.first.url
      ),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.sigue_adelante_radio.stream',
        androidNotificationChannelName: 'Radio online',
        androidNotificationOngoing: true,
        androidStopForegroundOnPause: true,
        preloadArtwork: true,
      ));
}

class AudioPlayerService extends BaseAudioHandler {
  static final _player = AudioPlayer();

  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  AudioPlayerService({required String url}) {
      loadStream(url);
    _notifyAudioHandlerAboutPlaybackEvents();
  }

  static loadStream(String url) async =>
      await _player.setUrl(url);

  void _notifyAudioHandlerAboutPlaybackEvents() {
    _player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = _player.playing;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          if (playing) MediaControl.pause else MediaControl.play,
        ],
        systemActions: const {
          MediaAction.seek,
        },
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
  Future<void> addQueueItems(List<MediaItem> mediaItems) async {
    // notify system
    final newQueue = queue.value..addAll(mediaItems);
    queue.add(newQueue);
  }

  @override
  Future<void> addQueueItem(MediaItem mediaItem) async {
    // notify system
    final newQueue = queue.value..add(mediaItem);
    queue.add(newQueue);
  }

  @override
  Future<void> removeQueueItemAt(int index) async {
    // notify system
    final newQueue = queue.value..removeAt(index);
    queue.add(newQueue);
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

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
