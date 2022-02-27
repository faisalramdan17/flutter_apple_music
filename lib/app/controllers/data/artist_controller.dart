import 'package:kuncie_music/core.dart';

class ArtistController extends SuperController<Artist> {
  ArtistController({required this.artistRepository});
  static ArtistController to = Get.find();
  IArtistRepository artistRepository;
  // Artist? artist;

  @override
  void onInit() async {
    super.onInit();
    String id = Get.arguments ?? "";
    getArtist(id);
  }

  Future<void> getArtist(String id) async {
    // Loading, Success, Error handle with 1 line of code
    return append(() => (() => artistRepository.getArtist(id)));
    // artist = await songRepository.getArtist(id);
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
