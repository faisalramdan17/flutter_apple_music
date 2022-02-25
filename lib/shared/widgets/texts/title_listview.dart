import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XTitleListView extends StatelessWidget {
  const XTitleListView({
    required this.text,
    this.onMorePressed,
    Key? key,
  }) : super(key: key);

  final String text;
  final void Function()? onMorePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Get.textTheme.titleMedium,
          ),
          onMorePressed == null
              ? const SizedBox()
              : GestureDetector(
                  onTap: onMorePressed,
                  child: Row(
                    children: [
                      Text(
                        "More",
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: Get.theme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Get.theme.primaryColor,
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
