import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

class AlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAlbumProvider>(() => AlbumProvider());
    Get.lazyPut<IAlbumRepository>(() => AlbumRepository(provider: Get.find()));
    Get.lazyPut(() => AlbumController(songRepository: Get.find()));
  }
}
