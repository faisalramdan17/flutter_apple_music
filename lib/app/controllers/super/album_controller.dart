import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

class AlbumController extends SuperController<Album> {
  AlbumController({required this.albumRepository});
  static AlbumController to = Get.find();
  IAlbumRepository albumRepository;
  // Album? albumsArtist;

  @override
  void onInit() async {
    super.onInit();

    getTop4Albums();
  }

  Future<void> getTop4Albums() async {
    //Loading, Success, Error handle with 1 line of code
    return append(() => albumRepository.getTop4Albums);
  }

  Future<void> getArtistAlbums(String id) async {
    // Loading, Success, Error handle with 1 line of code
    return append(() => (() => albumRepository.getArtistAlbums(id)));
    // albumsArtist = await songRepository.getArtistAlbums(id);
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
