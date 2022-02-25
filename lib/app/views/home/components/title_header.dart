import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
      child: Text(
        "Hi, MusicLova!",
        style: Get.textTheme.titleLarge,
      ),
    );
  }
}
