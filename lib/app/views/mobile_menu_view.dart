import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuncie_music/core.dart';

class MobileMenuView extends GetView<MobileMenuController> {
  const MobileMenuView({this.initialValue = 0, Key? key}) : super(key: key);
  final int initialValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageCotroller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeView(),
          SearchView(),
        ],
      ),
      bottomNavigationBar: ValueBuilder<int?>(
        initialValue: initialValue,
        builder: (value, updateFn) => XBottomBar(
          opacity: .2,
          currentIndex: value,
          onTap: (tab) {
            controller.pageCotroller.animateToPage(
              tab!,
              duration: controller.animationDuration,
              curve: Curves.ease,
            );
            updateFn(tab);
          },
          elevation: 8,
          hasInk: true, //new, gives a cute ink effect
          items: controller.navigationItems,
        ),
      ),
    );
  }
}
