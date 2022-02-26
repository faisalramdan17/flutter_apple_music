import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class XAvatarCircle extends StatelessWidget {
  const XAvatarCircle({
    this.photoURL,
    this.membership,
    this.color,
    this.progress = 0,
    this.isHideProgressBar = false,
    this.width = 55,
    this.maxRadius = 23,
    this.iconSize = 27,
    this.heroTag,
    Key? key,
  }) : super(key: key);

  final String? photoURL, heroTag, membership;
  final Color? color;
  final int progress;
  final double? maxRadius, iconSize;

  final bool isHideProgressBar;
  final double width;

  Widget emptyPhoto() {
    return Hero(
      tag: "empty-avatar" + (heroTag ?? Random().nextInt(100).toString()),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: maxRadius,
        child: Center(
          child: Icon(
            Iconsax.user,
            size: iconSize,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget emptyPhotoBorder() {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black87,
            width: 1.5,
          )),
      child: Hero(
        tag: "empty-avatar-border" +
            (heroTag ?? Random().nextInt(100).toString()),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: maxRadius,
          child: Center(
            child: Icon(
              Iconsax.user,
              size: iconSize,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width + 7,
      child: isHideProgressBar
          ? (photoURL?.isEmpty ?? true
              ? emptyPhotoBorder()
              : Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black45,
                        width: 0.7,
                      )),
                  child: Hero(
                    tag: "avatar" +
                        (heroTag ?? Random().nextInt(100).toString()),
                    child: CircleAvatar(
                      maxRadius: maxRadius,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(photoURL!),
                    ),
                  ),
                ))
          : Stack(
              children: [
                CircularStepProgressIndicator(
                  padding: 0,
                  currentStep: progress,
                  totalSteps: 100,
                  selectedStepSize: 3.7,
                  width: width,
                  height: width,
                  startingAngle: 2.3,
                  selectedColor: color ?? Colors.yellow[700],
                  unselectedColor: Colors.white,
                  roundedCap: (_, __) => true,
                  child: Center(
                    child: photoURL?.isEmpty ?? true
                        ? emptyPhoto()
                        : Hero(
                            tag: "avatar" +
                                (heroTag ?? Random().nextInt(100).toString()),
                            child: CircleAvatar(
                              maxRadius: width,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(photoURL!),
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Badge(
                    shape: BadgeShape.square,
                    animationType: BadgeAnimationType.scale,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2.2),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    badgeColor: color ?? Colors.yellow[600]!,
                    borderRadius: BorderRadius.circular(13),
                    elevation: 0,
                    badgeContent: Text(
                      membership ?? "Free",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
