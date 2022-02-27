import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class XAppBar extends StatelessWidget {
  const XAppBar({
    this.title,
    this.titlePadding,
    this.actions,
    this.borderRadius,
    this.isBorderRadius = true,
    Key? key,
  }) : super(key: key);

  final String? title;
  final EdgeInsets? titlePadding;
  final List<Widget>? actions;
  final BorderRadiusGeometry? borderRadius;
  final bool isBorderRadius;

  @override
  Widget build(BuildContext context) {
    final bool isBackButton = Navigator.canPop(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: !isBorderRadius
            ? null
            : borderRadius ??
                BorderRadius.only(
                  bottomLeft: Radius.circular(isBackButton ? 0 : 22),
                  bottomRight: const Radius.circular(22),
                ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 14.0, vertical: !isBackButton ? 5 : 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                !isBackButton
                    ? const SizedBox(width: 55)
                    : GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                            child: const Icon(
                              Iconsax.arrow_left_2,
                              size: 27,
                            )),
                      ),
                title == null
                    ? Container()
                    : Expanded(
                        child: Padding(
                          padding: titlePadding?.copyWith(
                                left: isBackButton ? 17.0 : 10,
                                top: isBackButton ? 0 : 17,
                                bottom: isBackButton ? 0 : 17,
                              ) ??
                              EdgeInsets.only(
                                left: isBackButton ? 17.0 : 10,
                                top: isBackButton ? 0 : 17,
                                bottom: isBackButton ? 0 : 17,
                              ),
                          child: Text(
                            title ?? "-",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          actions == null
              ? const SizedBox(width: 55)
              : Row(
                  children: actions ?? [],
                ),
        ],
      ),
    );
  }
}
