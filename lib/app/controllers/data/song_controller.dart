import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class SongController extends SuperController<Song> {
  SongController({required this.songRepository});
  static SongController to = Get.find<SongController>();
  ISongRepository songRepository;
  Song? searchedSongs, songsArtist;
  late TextEditingController searchTextCtrl;

  @override
  void onInit() async {
    super.onInit();
    searchTextCtrl = TextEditingController();
    getRecentTopSongs();
  }

  Future<void> getRecentTopSongs() async {
    //Loading, Success, Error handle with 1 line of code
    return append(() => songRepository.getRecentTopSongs);
  }

  Future<void> setEmpty() async {
    return append(() => (() => Future<Song>.value(Song())));
  }

  Future<void> searchArtistSongs() async {
    searchedSongs =
        await songRepository.getSearchArtistSongs(searchTextCtrl.text);
    update();
  }

  Future<void> getArtistSongs(String id) async {
    songsArtist = await songRepository.getArtistSongs(id);
    update();
  }

  // Remove any text in search field
  void onClearTapped() {
    searchTextCtrl.clear();
    update();
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
