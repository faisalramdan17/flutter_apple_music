import 'package:kuncie_music/core.dart';

class PlayingSongController extends SuperController<SongItem> {
  static PlayingSongController to = Get.find<PlayingSongController>();

  @override
  void onInit() async {
    super.onInit();
    append(() => (() async => await Future<SongItem>.value(SongItem())));
  }

  Future<void> createPlayedSong(SongItem item) async {
    return append(() => (() async => await Future<SongItem>.value(item)));
  }

  @override
  void onClose() {
    super.onClose();
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
