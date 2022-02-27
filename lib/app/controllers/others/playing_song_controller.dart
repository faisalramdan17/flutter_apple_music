import 'package:audio_service/audio_service.dart';
import 'package:kuncie_music/core.dart';
import 'package:rxdart/rxdart.dart' as x;

class PlayingSongController extends SuperController<SongItem> {
  static PlayingSongController to = Get.find<PlayingSongController>();
  late AudioHandler audioHandler; // singleton.
  AudioServiceRepeatMode repeatMode = AudioServiceRepeatMode.none;

  @override
  void onInit() async {
    super.onInit();

    audioHandler = await AudioService.init(
      builder: () => AudioPlayerHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'id.codingyourlife.myapp.channel.audio',
        androidNotificationChannelName: 'Kuncie Music playback',
        androidNotificationOngoing: true,
        // androidStopForegroundOnPause: true,
      ),
    );

    audioHandler.playbackState.listen((playbackState) async {
      if (playbackState.processingState == AudioProcessingState.completed) {
        await audioHandler.stop();
      }
    });

    append(() => (() async => await Future<SongItem>.value(SongItem())));
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

  Stream<MediaState> get mediaStateStream =>
      x.Rx.combineLatest2<MediaItem?, Duration, MediaState>(
          audioHandler.mediaItem,
          AudioService.position,
          (mediaItem, position) => MediaState(mediaItem, position));

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
