import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({this.item, Key? key}) : super(key: key);
  final AlbumItem? item;

  @override
  Widget build(BuildContext context) {
    var _height = Get.height / 3;

    return item == null
        ? FadeShimmer(
            height: _height,
            width: double.infinity,
            radius: 11,
            highlightColor: Get.theme.primaryColor.withOpacity(0.7),
            baseColor: Get.theme.secondaryHeaderColor,
          )
        : CachedNetworkImage(
            imageUrl: item!.artworkUrl100!,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Padding(
              padding: const EdgeInsets.all(30.0),
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                strokeWidth: 0.7,
              ),
            ),
            errorWidget: (context, url, error) => _albumBody(_height),
            imageBuilder: (context, path) => _albumBody(_height, path),
          );
  }

  Widget _albumBody(double _height, [ImageProvider<Object>? path]) {
    return Container(
      height: _height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: path == null ? Get.theme.primaryColor.withOpacity(0.7) : null,
        image: path == null
            ? null
            : DecorationImage(
                image: path,
                fit: BoxFit.fill,
              ),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          gradient: path == null
              ? null
              : LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [
                    0.0,
                    0.25,
                    0.45,
                  ],
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item?.collectionName?.toTitleCase() ?? "-",
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Divider(
                        height: 5,
                        color: Colors.transparent,
                      ),
                      Text(
                        item?.artistName?.toTitleCase() ?? "-",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
