import 'package:kuncie_music/core.dart';
import 'package:flutter/foundation.dart';

abstract class IAlbumRepository {
  Future<Album> getTop4Albums();
  Future<Album> getArtistAlbums(String artistId);
}

class AlbumRepository implements IAlbumRepository {
  AlbumRepository({required this.provider});
  final IAlbumProvider provider;

  @override
  Future<Album> getTop4Albums() async {
    const String entity = "album";
    const String id = "126411124, 320569549, 1062085272, 463996386";

    final responseAlbum =
        await provider.getTop4Albums("/lookup?id=$id&entity=$entity&limit=1");

    responseAlbum.body!.items
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

    responseAlbum.body!.items
        ?.removeWhere((item) => item.collectionType?.toLowerCase() != "album");

    if (responseAlbum.status.hasError) {
      debugPrint("ERROR = ${responseAlbum.statusText!}");
      return Future.error(responseAlbum.statusText!);
    } else {
      return responseAlbum.body!;
    }
  }
}
