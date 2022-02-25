import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kuncie_music/core.dart';

class XBottomBarNavigation {
  List<XBottomBarItem> getNavigationItemList() {
    return <XBottomBarItem>[
      XBottomBarItem(
        backgroundColor: Get.theme.primaryColor,
        icon: const Icon(
          Iconsax.music_play5,
          color: Colors.black54,
        ),
        activeIcon: const Icon(Iconsax.music_play5),
        title: const Text(
          "Music",
          style: TextStyle(fontSize: 18),
        ),
      ),
      XBottomBarItem(
        backgroundColor: Get.theme.primaryColor,
        icon: const Icon(
          Iconsax.search_normal,
          color: Colors.black54,
        ),
        activeIcon: const Icon(Iconsax.search_normal),
        title: const Text(
          "Search",
          style: TextStyle(fontSize: 18),
        ),
      ),
    ];
  }
}
