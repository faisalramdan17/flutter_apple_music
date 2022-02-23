import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

class AlbumController extends SuperController<Album> {
  AlbumController({required this.songRepository});
  static AlbumController to = Get.find();
  IAlbumRepository songRepository;
  Album? albumsArtist;

  @override
  void onInit() async {
    super.onInit();

    //Loading, Success, Error handle with 1 line of code
    append(() => songRepository.getTop4Albums);
  }

  Future<void> getSongsArtist(String id) async {
    albumsArtist = await songRepository.getAlbumsArtist(id);
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
