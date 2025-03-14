
import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:sigue_adelante_radio/src/shared/home/services/audio_service.dart';
import 'package:sigue_adelante_radio/src/shared/home/services/page_manager.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<AudioHandler>(await initAudioService());
  getIt.registerLazySingleton<PageManager>(() => PageManager());
}