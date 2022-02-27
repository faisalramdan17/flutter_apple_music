import 'package:audio_service/audio_service.dart';
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
        height: 70,
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
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(left: 15.0),
                  decoration: BoxDecoration(
                    image: state!.artworkUrl100 == null
                        ? null
                        : DecorationImage(
                            image: NetworkImage(state.artworkUrl100!),
                            fit: BoxFit.cover,
                          ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Expanded(
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
                                        fontSize: 12,
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
                                        fontSize: 10,
                                        color: Color(0xFF58595C),
                                        letterSpacing: 1,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              GetBuilder<PlayingSongController>(
                                builder: (state) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (state.repeatMode ==
                                          AudioServiceRepeatMode.one) {
                                        controller.setRepeatMode(
                                          AudioServiceRepeatMode.none,
                                        );
                                      } else {
                                        controller.setRepeatMode(
                                          AudioServiceRepeatMode.one,
                                        );
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: Icon(
                                        Iconsax.repeate_one,
                                        size: 22,
                                        color: state.repeatMode ==
                                                AudioServiceRepeatMode.one
                                            ? Colors.blue
                                            : Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              StreamBuilder<PlaybackState>(
                                stream: controller.audioHandler.playbackState,
                                builder: (context, snapshot) {
                                  // final repeatMode =
                                  //     snapshot.data?.repeatMode ??
                                  //         AudioServiceRepeatMode.none;
                                  // print("repeatMode 2 = $repeatMode");
                                  final isPlaying =
                                      snapshot.data?.playing ?? false;
                                  final isIdle =
                                      snapshot.data?.processingState ==
                                          AudioProcessingState.idle;
                                  return GestureDetector(
                                    onTap: () {
                                      if (isIdle) {
                                        controller.addPlayingSong(state);
                                      } else if (isPlaying) {
                                        controller.audioHandler.pause();
                                      } else {
                                        controller.audioHandler.play();
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: Icon(
                                        isPlaying
                                            ? Iconsax.pause
                                            : Iconsax.play,
                                        size: isPlaying ? 20 : 23,
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
                                      const Duration(seconds: 30),
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
