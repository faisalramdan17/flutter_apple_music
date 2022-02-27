import 'package:get/get.dart';
import 'package:kuncie_music/app/xcore.dart';

class MobileMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MobileMenuController());
    Get.put<NotificationController>(NotificationController());
  }
}
