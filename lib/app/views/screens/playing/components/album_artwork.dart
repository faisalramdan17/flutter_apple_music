import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class AlbumArtwork extends StatelessWidget {
  const AlbumArtwork({this.imageUrl, Key? key}) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    const double _height = 286;
    const double _radius = 27;

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Stack(
        children: <Widget>[
          // _imageEmpty(_height, _radius),
          _imageAvailable(_height, _radius),
          imageUrl?.isEmpty ?? true
              ? _imageEmpty(_height, _radius)
              : _imageAvailable(_height, _radius),
          Opacity(
            opacity: 0.55,
            child: Container(
              width: double.infinity,
              height: _height,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(_radius)),
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

  Widget _imageEmpty(double _size, double _radius) {
    return Container(
      width: double.infinity,
      height: _size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(_radius)),
        color: Colors.grey[400],
      ),
      child: const Center(
        child: Icon(
          Icons.music_note,
          size: 27,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _imageAvailable(double _size, double _radius) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(
        height: _size,
        width: _size,
        padding: const EdgeInsets.all(10.0),
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          strokeWidth: 0.7,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: _size,
        width: _size,
        decoration: BoxDecoration(
          color: Get.theme.primaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(_radius)),
        ),
      ),
      imageBuilder: (context, path) {
        return Container(
          width: double.infinity,
          height: _size,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: path,
              fit: BoxFit.cover,
            ),
            borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(_radius)),
          ),
        );
      },
    );
  }
}
