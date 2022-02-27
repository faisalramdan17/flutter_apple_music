import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kuncie_music/core.dart';

class SongTile extends GetView<PlayingSongController> {
  const SongTile({required this.item, Key? key}) : super(key: key);
  final SongItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.addPlayingSong(item);
      },
      child: controller.obx((state) {
        bool _isSelectedSong = item.trackId == state?.trackId;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: _isSelectedSong
                ? LinearGradient(
                    colors: [
                      const Color(0xFF9BD9FF).withOpacity(0.7),
                      Colors.white,
                    ],
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(item.artworkUrl100!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item.trackName?.toTitleCase() ?? "-",
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.7,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item.artistName?.toTitleCase() ?? "-",
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  color: Color(0xFF58595C),
                                  letterSpacing: 1,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item.collectionName?.toTitleCase() ?? "-",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFFADB9CD),
                                  letterSpacing: 1,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder<bool>(
                      stream: controller.audioHandler.playbackState
                          .map((state) => state.playing)
                          .distinct(),
                      builder: (context, snapshot) {
                        final isPlaying = snapshot.data ?? false;

                        return _isSelectedSong && isPlaying
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: SpinKitWave(
                                  color: Get.context!.theme.primaryColor
                                      .withOpacity(0.8),
                                  duration: const Duration(milliseconds: 1500),
                                  size: 15,
                                ),
                              )
                            : const SizedBox();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
