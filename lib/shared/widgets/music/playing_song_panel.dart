import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kuncie_music/core.dart';

class PlayingSongPanel extends GetView<PlayingSongController> {
  const PlayingSongPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      if (state?.trackId == null) return const SizedBox();
      return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFD1EDFF).withOpacity(0.7),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      image: state!.artworkUrl100 == null
                          ? null
                          : DecorationImage(
                              image: NetworkImage(state.artworkUrl100!),
                              fit: BoxFit.fill,
                            ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      state.trackName?.toTitleCase() ?? "-",
                                      style: const TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.7,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      state.artistName?.toTitleCase() ?? "-",
                                      style: const TextStyle(
                                        fontSize: 12.5,
                                        color: Color(0xFF58595C),
                                        letterSpacing: 1,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              StreamBuilder<bool>(
                                stream: controller.audioHandler.playbackState
                                    .map((state) => state.playing)
                                    .distinct(),
                                builder: (context, snapshot) {
                                  final isPlaying = snapshot.data ?? false;
                                  return GestureDetector(
                                    onTap: isPlaying
                                        ? controller.audioHandler.pause
                                        : controller.audioHandler.play,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 17),
                                      child: Icon(
                                        isPlaying
                                            ? Iconsax.pause
                                            : Iconsax.play,
                                        size: isPlaying ? 22 : 25,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        ValueBuilder<double?>(
                          initialValue: 50,
                          builder: (_value, updateFn) {
                            return StreamBuilder<MediaState>(
                              stream: controller.mediaStateStream,
                              builder: (context, snapshot) {
                                final mediaState = snapshot.data;
                                return SliderPlayingSong(
                                  duration: mediaState?.mediaItem?.duration ??
                                      Duration.zero,
                                  position:
                                      mediaState?.position ?? Duration.zero,
                                  onChangeEnd: (newPosition) {
                                    controller.audioHandler.seek(newPosition);
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
