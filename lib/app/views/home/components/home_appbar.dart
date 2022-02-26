import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kuncie_music/core.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          XAvatarCircle(
            photoURL: "https://avatars.githubusercontent.com/u/44645967?v=4",
            progress: 77,
            width: 60,
            color: Colors.blue[400],
          ),
          const Text(
            "Kuncie Apple Music",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Badge(
                animationType: BadgeAnimationType.scale,
                animationDuration: const Duration(milliseconds: 200),
                badgeColor: Colors.red[400]!.withOpacity(0.9),
                position: BadgePosition.topEnd(end: -4),
                badgeContent: const Text(
                  '7',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                child: const Icon(
                  Iconsax.notification_bing,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
