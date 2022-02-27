import 'dart:math';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width + 9,
      child: isHideProgressBar
          ? (photoURL?.isEmpty ?? true
              ? _emptyPhotoBorder()
              : _heroAvatar(maxRadius: maxRadius))
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
                  selectedColor: color ?? Get.theme.primaryColor,
                  unselectedColor: Colors.white,
                  roundedCap: (_, __) => true,
                  child: Center(
                    child: photoURL?.isEmpty ?? true
                        ? _emptyPhoto()
                        : _heroAvatar(maxRadius: width),
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
                    badgeColor: color ?? Get.theme.primaryColor,
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

  Widget _heroAvatar({double? maxRadius}) {
    return Hero(
      tag: "avatar" + (heroTag ?? Random().nextInt(100).toString()),
      child: CachedNetworkImage(
          imageUrl: photoURL!,
          progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                padding: const EdgeInsets.all(9.0),
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  strokeWidth: 0.7,
                ),
              ),
          errorWidget: (context, url, error) => _iconAvatar(),
          imageBuilder: (context, path) {
            return CircleAvatar(
              maxRadius: maxRadius,
              backgroundColor: Colors.white,
              backgroundImage: path,
            );
          }),
    );
  }

  Widget _emptyPhoto() {
    return Hero(
      tag: "empty-avatar" + (heroTag ?? Random().nextInt(100).toString()),
      child: _iconAvatar(),
    );
  }

  Widget _emptyPhotoBorder() {
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
        child: _iconAvatar(),
      ),
    );
  }

  CircleAvatar _iconAvatar() {
    return CircleAvatar(
      backgroundColor: Colors.white,
      maxRadius: maxRadius,
      child: Center(
        child: Icon(
          Iconsax.user,
          size: iconSize,
          color: Colors.black87,
        ),
      ),
    );
  }
}
