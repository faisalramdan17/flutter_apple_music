import 'package:kuncie_music/core.dart';
import 'package:flutter/foundation.dart';

abstract class IAlbumRepository {
  Future<Album> getTopAlbums();
  Future<Album> getArtistAlbums(String artistId);
}

class AlbumRepository implements IAlbumRepository {
  AlbumRepository({required this.provider});
  final IAlbumProvider provider;

  @override
  Future<Album> getTopAlbums() async {
    const String entity = "album";
    const String id =
        "951996691,  397934108, 126411124, 252239625, 1062085272, 463996386";

    final responseAlbum =
        await provider.getTopAlbums("/lookup?id=$id&entity=$entity&limit=1");

    responseAlbum.body?.items
        ?.removeWhere((item) => item.collectionType?.toLowerCase() != "album");

    if (responseAlbum.status.hasError) {
      debugPrint("ERROR = ${responseAlbum.statusText!}");
      return Future.error(responseAlbum.statusText!);
    } else {
      return responseAlbum.body!;
    }
  }

  @override
  Future<Album> getArtistAlbums(String artistId) async {
    final responseAlbum = await provider
        .getArtistAlbums("/lookup?id=$artistId&entity=album&sort=recent");

    responseAlbum.body?.items
        ?.removeWhere((item) => item.collectionType?.toLowerCase() != "album");

    if (responseAlbum.status.hasError) {
      debugPrint("ERROR = ${responseAlbum.statusText!}");
      return Future.error(responseAlbum.statusText!);
    } else {
      return responseAlbum.body!;
    }
  }
}
