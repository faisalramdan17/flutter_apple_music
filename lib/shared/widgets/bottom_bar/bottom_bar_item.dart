import 'package:flutter/material.dart';

class XBottomBarItem {
  const XBottomBarItem({
    required this.icon,
    required this.activeIcon,
    this.title,
    this.showBadge = false,
    this.badgeColor = Colors.black,
    this.badge,
    this.backgroundColor,
  });

  final Widget icon;
  final Widget? activeIcon;
  final Widget? title;
  final bool showBadge;
  final Color badgeColor;
  final Widget? badge; // The content of badge. Usually Text or Icon.
  final Color? backgroundColor;
}
