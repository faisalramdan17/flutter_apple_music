import 'package:kuncie_music/core.dart';

class AlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAlbumProvider>(() => AlbumProvider());
    Get.lazyPut<IAlbumRepository>(() => AlbumRepository(provider: Get.find()));
    Get.lazyPut(() => AlbumController(albumRepository: Get.find()));
  }
}
