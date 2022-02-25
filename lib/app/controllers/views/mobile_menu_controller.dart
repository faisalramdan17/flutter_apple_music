import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuncie_music/core.dart';

class MobileMenuController extends GetxController {
  final pageCotroller = PageController();
  final animationDuration = const Duration(milliseconds: 350);
  late List<XBottomBarItem> navigationItems;

  @override
  void onInit() {
    navigationItems = XBottomBarNavigation().getNavigationItemList();
    super.onInit();
  }

  @override
  void onClose() {
    pageCotroller.dispose();
    Get.delete();
    debugPrint("[ MainController ] => onClose()");
    super.onClose();
  }
}
