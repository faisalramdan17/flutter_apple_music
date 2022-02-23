import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

class SongBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ISongProvider>(() => SongProvider());
    Get.lazyPut<ISongRepository>(() => SongRepository(provider: Get.find()));
    Get.lazyPut(() => SongController(songRepository: Get.find()));
  }
}
