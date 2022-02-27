import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kuncie_music/core.dart';

class SongTile extends GetView<NowPlayingController> {
  const SongTile({this.item, Key? key}) : super(key: key);
  final SongItem? item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item == null ? null : () => controller.addPlayingSong(item!),
      child: controller.obx((state) {
        bool _isSelectedSong =
            item != null && (item?.trackId == state?.trackId);

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
                    _songImage(),
                    Expanded(
                      child: _songContenText(),
                    ),
                    _songIndicatorPlaying(_isSelectedSong),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _songImage() {
    return item == null
        ? FadeShimmer(
            height: 60,
            width: 60,
            radius: 8,
            highlightColor: Get.theme.primaryColor.withOpacity(0.7),
            baseColor: Get.theme.secondaryHeaderColor,
          )
        : CachedNetworkImage(
            imageUrl: item!.artworkUrl100!,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(10.0),
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                strokeWidth: 0.7,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Get.theme.primaryColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            imageBuilder: (context, path) {
              return Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: path,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            },
          );
  }

  Widget _songContenText() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            item == null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: FadeShimmer(
                      height: 13,
                      width: 160,
                      radius: 8,
                      highlightColor: Get.theme.primaryColor.withOpacity(0.7),
                      baseColor: Get.theme.secondaryHeaderColor,
                    ),
                  )
                : Text(
                    item?.trackName?.toTitleCase() ?? "-",
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            const SizedBox(height: 2),
            item == null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: FadeShimmer(
                      height: 12,
                      width: 320,
                      radius: 8,
                      highlightColor: Get.theme.primaryColor.withOpacity(0.7),
                      baseColor: Get.theme.secondaryHeaderColor,
                    ),
                  )
                : Text(
                    item?.artistName?.toTitleCase() ?? "-",
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF3E424D),
                      letterSpacing: 1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            const SizedBox(height: 2),
            item == null
                ? FadeShimmer(
                    height: 12,
                    width: 320,
                    radius: 8,
                    highlightColor: Get.theme.primaryColor.withOpacity(0.7),
                    baseColor: Get.theme.secondaryHeaderColor,
                  )
                : Text(
                    item?.collectionName?.toTitleCase() ?? "-",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF7B8597),
                      letterSpacing: 1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _songIndicatorPlaying(bool _isSelectedSong) {
    return StreamBuilder<bool>(
      stream: controller.audioHandler.playbackState
          .map((state) => state.playing)
          .distinct(),
      builder: (context, snapshot) {
        final isPlaying = snapshot.data ?? false;
        return _isSelectedSong && isPlaying
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SpinKitWave(
                  color: Get.context!.theme.primaryColor.withOpacity(0.8),
                  duration: const Duration(milliseconds: 1500),
                  size: 15,
                ),
              )
            : const SizedBox();
      },
    );
  }
}
