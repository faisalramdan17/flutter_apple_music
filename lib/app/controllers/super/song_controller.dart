import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

class SongController extends SuperController<Song> {
  SongController({required this.songRepository});
  static SongController to = Get.find<SongController>();
  ISongRepository songRepository;
  // Song? searchArtistSongs, songsArtist;
  late TextEditingController searchTextCtrl;

  @override
  void onInit() async {
    super.onInit();
    searchTextCtrl = TextEditingController();
    get7MostRecentSongs();
  }

  Future<void> get7MostRecentSongs() async {
    //Loading, Success, Error handle with 1 line of code
    return append(() => songRepository.get7MostRecentSongs);
  }

  Future<void> getSearchArtistSongs() async {
    return append(
        () => (() => songRepository.getSearchArtistSongs(searchTextCtrl.text)));
    // searchArtistSongs =
    //     await songRepository.getSearchArtistSongs(searchTextCtrl.text);
    // update();
  }

  Future<void> getArtistSongs(String id) async {
    return append(() => (() => songRepository.getArtistSongs(id)));
    // songsArtist = await songRepository.getArtistSongs(id);
    // update();
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
