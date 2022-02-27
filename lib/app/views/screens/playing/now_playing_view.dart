import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

import 'components/album_artwork.dart';
import 'components/music_board_controls.dart';
import 'components/preferences_board.dart';

class NowPlayingView extends GetView<NowPlayingController> {
  const NowPlayingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: controller.obx((state) {
        if (state?.trackId == null) return const SizedBox();

        return SafeArea(
          top: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: Get.width + 50,
                      child: Stack(
                        children: <Widget>[
                          AlbumArtwork(imageUrl: state!.artworkUrl100),
                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: MusicBoardControls(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    const PreferencesBoard(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            (state.artistName?.toTitleCase() ?? "-") +
                                " • " +
                                (state.collectionName?.toTitleCase() ?? "-"),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFADB9CD),
                              letterSpacing: 1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Divider(
                            height: 5,
                            color: Colors.transparent,
                          ),
                          Text(
                            state.trackName ?? "-",
                            style: const TextStyle(
                              fontSize: 23,
                              color: Color(0xFF4D6B9C),
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: HideIcon(
                          color: Get.theme.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 40),
                child: Obx(
                  () => NowPlayingSlider(
                    position: controller.mediaState.value.position,
                    duration: controller.mediaState.value.mediaItem?.duration ??
                        Duration.zero,
                    onChangeEnd: (newPosition) {
                      controller.audioHandler.seek(newPosition);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}