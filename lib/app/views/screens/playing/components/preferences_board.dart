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
            _songLinkButton(controller),
            _repeatButton(controller),
            _albumLinkButton(controller),
          ],
        );
      },
    );
  }

  Widget _songLinkButton(NowPlayingController controller) {
    return InkWell(
      onTap: () => launch(controller.state!.trackViewUrl!),
      borderRadius: BorderRadius.circular(70),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Iconsax.music_circle,
          size: 37,
          color: Color(0xFF7B92CA),
        ),
      ),
    );
  }

  Widget _repeatButton(NowPlayingController controller) {
    return InkWell(
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
      borderRadius: BorderRadius.circular(70),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Iconsax.repeate_one,
          size: 37,
          color: controller.repeatMode == AudioServiceRepeatMode.one
              ? Get.theme.primaryColor
              : Colors.grey,
        ),
      ),
    );
  }

  Widget _albumLinkButton(NowPlayingController controller) {
    return InkWell(
      onTap: () => launch(controller.state!.collectionViewUrl!),
      borderRadius: BorderRadius.circular(70),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Iconsax.music_playlist,
          size: 37,
          color: Color(0xFF7B92CA),
        ),
      ),
    );
  }
}
