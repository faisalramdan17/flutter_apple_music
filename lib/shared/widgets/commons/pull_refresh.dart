import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

enum ColorType { white, blue }

class XPullRefresh extends StatelessWidget {
  const XPullRefresh({
    required this.onRefresh,
    required this.child,
    this.colorType = ColorType.white,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final Future<void> Function() onRefresh;
  final ColorType colorType;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: onRefresh,
      showChildOpacityTransition: false,
      color:
          colorType != ColorType.white ? Colors.white : Get.theme.primaryColor,
      backgroundColor: Get.isDarkMode
          ? null
          : (colorType != ColorType.white
              ? Get.theme.primaryColor
              : Colors.white),
      height: 87,
      springAnimationDurationInMilliseconds: 600,
      animSpeedFactor: 1.2,
      child: child,
    );
  }
}
