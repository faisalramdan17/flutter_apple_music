import 'package:kuncie_music/core.dart';

class ArtistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IArtistProvider>(() => ArtistProvider());
    Get.lazyPut<IArtistRepository>(
        () => ArtistRepository(provider: Get.find()));
    Get.lazyPut(() => ArtistController(artistRepository: Get.find()));
  }
}
