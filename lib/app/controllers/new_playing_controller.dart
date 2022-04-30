import 'package:audio_service/audio_service.dart';
import 'package:kuncie_music/core.dart';

class NowPlayingController extends SuperController<SongItem> {
  static NowPlayingController to = Get.find<NowPlayingController>();
  late AudioHandler audioHandler; // singleton.
  AudioServiceRepeatMode repeatMode = AudioServiceRepeatMode.none;
  late Rx<MediaState> mediaState;

  @override
  void onInit() async {
    super.onInit();

    audioHandler = await AudioService.init(
      builder: () => AudioPlayerHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'id.codingyourlife.myapp.channel.audio',
        androidNotificationChannelName: 'Kuncie Music playback',
        androidNotificationOngoing: true,
        androidStopForegroundOnPause: true,
      ),
    );

    mediaState = MediaState(audioHandler.mediaItem.value, Duration.zero).obs;

    initAudioListener();
    append(() => (() async => await Future<SongItem>.value(SongItem())));
  }

  void initAudioListener() {
    AudioService.position.listen((position) {
      mediaState.value = MediaState(audioHandler.mediaItem.value, position);
    });

    audioHandler.playbackState.listen((playbackState) async {
      if (playbackState.processingState == AudioProcessingState.completed) {
        await audioHandler.pause();
      }
    });
  }

  Future<void> setRepeatMode(AudioServiceRepeatMode mode) async {
    await audioHandler.setRepeatMode(mode);
    repeatMode = mode;
    update();
  }

  Future<void> addPlayingSong(SongItem item) async {
    append(() => (() async => await Future<SongItem>.value(item)));

    final _item = MediaItem(
      id: item.previewUrl!,
      album: item.collectionName,
      title: item.trackName!,
      artist: item.artistName,
      artUri: Uri.parse(item.artworkUrl100!),
    );
    await audioHandler.playMediaItem(_item);
    await audioHandler.play();
  }

  @override
  void onDetached() {
    // Implement onDetached
  }

  @override
  void onInactive() {
    // Implement onInactive
  }

  @override
  void onPaused() {
    // Implement onPaused
  }

  @override
  void onResumed() {
    // Implement onResumed
  }
}
