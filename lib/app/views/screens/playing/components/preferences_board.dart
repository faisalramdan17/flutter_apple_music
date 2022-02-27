import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kuncie_music/core.dart';
import 'package:url_launcher/url_launcher.dart';

class PreferencesBoard extends StatelessWidget {
  const PreferencesBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NowPlayingController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => launch(controller.state!.trackViewUrl!),
              icon: const Icon(
                Iconsax.music_circle,
                size: 37,
                color: Color(0xFF7B92CA),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (controller.repeatMode == AudioServiceRepeatMode.one) {
                  controller.setRepeatMode(
                    AudioServiceRepeatMode.none,
                  );
                } else {
                  controller.setRepeatMode(
                    AudioServiceRepeatMode.one,
                  );
                }
              },
              child: Icon(
                Iconsax.repeate_one,
                size: 37,
                color: controller.repeatMode == AudioServiceRepeatMode.one
                    ? Get.theme.primaryColor
                    : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () => launch(controller.state!.collectionViewUrl!),
              icon: const Icon(
                Iconsax.music_playlist,
                size: 37,
                color: Color(0xFF7B92CA),
              ),
            ),
          ],
        );
      },
    );
  }
}
