import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

class SongController extends SuperController<Song> {
  SongController({required this.songRepository});
  static SongController to = Get.find();
  ISongRepository songRepository;
  Song? searchArtistSongs, songsArtist;
  late TextEditingController searchTextCtrl;

  @override
  void onInit() async {
    super.onInit();

    searchTextCtrl = TextEditingController();

    //Loading, Success, Error handle with 1 line of code
    append(() => songRepository.get5MostRecentSongs);
  }

  Future<void> getSearchArtistSongs() async {
    searchArtistSongs =
        await songRepository.getSearchArtistSongs(searchTextCtrl.text);
    update();
  }

  Future<void> getSongsArtist(String id) async {
    songsArtist = await songRepository.getSongsArtist(id);
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
