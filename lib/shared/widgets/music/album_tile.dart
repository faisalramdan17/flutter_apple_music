import 'package:flutter/material.dart';
import 'package:kuncie_music/core.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({required this.item, Key? key}) : super(key: key);
  final AlbumItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(item.artworkUrl100!),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [
              0.0,
              0.45,
            ],
            colors: [
              Colors.black.withOpacity(0.8),
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
                        item.collectionName?.toTitleCase() ?? "-",
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
                        item.artistName?.toTitleCase() ?? "-",
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
