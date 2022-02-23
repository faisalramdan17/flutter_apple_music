import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

class ArtistController extends SuperController<Artist> {
  ArtistController({required this.songRepository});
  static ArtistController to = Get.find();
  IArtistRepository songRepository;
  Artist? artist;

  @override
  void onInit() async {
    super.onInit();

    //Loading, Success, Error handle with 1 line of code
    // append(() => songRepository.getTop4Albums);
  }

  Future<void> getArtist(String id) async {
    artist = await songRepository.getArtist(id);
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
