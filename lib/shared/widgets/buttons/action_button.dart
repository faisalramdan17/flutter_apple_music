import 'package:kuncie_music/core.dart';
import 'package:flutter/material.dart';

class XActionButton extends StatelessWidget {
  const XActionButton({
    required this.label,
    this.icon,
    required this.onPressed,
    this.iconSize = 17,
    this.padding,
    this.backgroundColor,
    this.colorIcon = Colors.white,
    Key? key,
  }) : super(key: key);

  final Text label;
  final IconData? icon;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  final Color? backgroundColor, colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? Get.theme.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 18 * 1.5,
            vertical: 18 / 2,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(
                  icon,
                  size: iconSize,
                  color: colorIcon,
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: label,
            ),
          ],
        ),
      ),
    );
  }
}
