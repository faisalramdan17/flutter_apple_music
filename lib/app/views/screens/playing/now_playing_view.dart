import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

import 'components/album_artwork.dart';
import 'components/controls_board.dart';
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
                child: _bodyHeader(state!),
              ),
              _bodyFooter(state),
            ],
          ),
        );
      }),
    );
  }

  Widget _bodyHeader(SongItem state) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 320,
          child: Stack(
            children: <Widget>[
              AlbumArtwork(imageUrl: state.artworkUrl100),
              const ControlsBoard(),
            ],
          ),
        ),
        const SizedBox(height: 40),
        const PreferencesBoard(),
      ],
    );
  }

  Widget _bodyFooter(SongItem state) {
    return Column(
      children: [
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
                        color: Color(0xFF8994A7),
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
                        fontSize: 22,
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
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 40),
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
    );
  }
}
