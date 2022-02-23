import 'package:kuncie_music/core.dart';
import 'package:flutter/foundation.dart';

abstract class IAlbumRepository {
  Future<Album> getTop4Albums();
  Future<Album> getAlbumsArtist(String artistId);
}

class AlbumRepository implements IAlbumRepository {
  AlbumRepository({required this.provider});
  final IAlbumProvider provider;

  @override
  Future<Album> getTop4Albums() async {
    const String entity = "album";
    const String id = "335438840, 320569549, 941107698, 463996386";

    final responseAlbum =
        await provider.getTop4Albums("/lookup?id=$id&entity=$entity&limit=1");

    responseAlbum.body!.items
        ?.where((item) => item.collectionType?.toLowerCase() == "album");

    if (responseAlbum.status.hasError) {
      debugPrint("ERROR = ${responseAlbum.statusText!}");
      return Future.error(responseAlbum.statusText!);
    } else {
      return responseAlbum.body!;
    }
  }

  @override
  Future<Album> getAlbumsArtist(String artistId) async {
    final responseAlbum = await provider
        .getAlbumsArtist("/lookup?id=$artistId&entity=album&sort=recent");

    responseAlbum.body!.items
        ?.where((item) => item.collectionType?.toLowerCase() == "album");

    if (responseAlbum.status.hasError) {
      debugPrint("ERROR = ${responseAlbum.statusText!}");
      return Future.error(responseAlbum.statusText!);
    } else {
      return responseAlbum.body!;
    }
  }
}
