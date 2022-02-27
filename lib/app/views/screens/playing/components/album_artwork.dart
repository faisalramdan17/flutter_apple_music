import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class AlbumArtwork extends StatelessWidget {
  const AlbumArtwork({this.imageUrl, Key? key}) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Stack(
        children: <Widget>[
          imageUrl?.isEmpty ?? true ? _imageEmpty() : _imageAvailable(),
          Opacity(
            opacity: 0.55,
            child: Container(
              width: double.infinity,
              height: Get.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [
                    0.0,
                    0.85,
                  ],
                  colors: [
                    Color(0xFF47ACE1),
                    Color(0xFF2344FC),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageEmpty() {
    return Container(
      width: double.infinity,
      height: Get.width,
      color: Colors.grey[400],
      child: const Center(
        child: Icon(
          Icons.music_note,
          size: 27,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _imageAvailable() {
    return SizedBox(
      width: double.infinity,
      height: Get.width,
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        progressIndicatorBuilder: (context, url, downloadProgress) => Container(
          height: Get.width,
          width: Get.width,
          padding: const EdgeInsets.all(10.0),
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
            strokeWidth: 0.7,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: Get.width,
          width: Get.width,
          decoration: BoxDecoration(
            color: Get.theme.primaryColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        imageBuilder: (context, path) {
          return Container(
            height: Get.width,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: path,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
      ),
    );
  }
}
