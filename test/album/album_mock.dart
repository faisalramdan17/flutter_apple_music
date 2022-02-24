import 'dart:math';
import 'package:kuncie_music/core.dart';
import 'data/artist_albums.dart';
import 'data/top_4_albums.dart';

class MockRepository implements IAlbumRepository {
  @override
  Future<Album> getTop4Albums() async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (Random().nextBool()) {
      return Album.fromJson(top4Albums);
    }

    return Future<Album>.error('error');
  }

  @override
  Future<Album> getArtistAlbums(String artistId) async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (Random().nextBool()) {
      return Album.fromJson(artistAlbums);
    }

    return Future<Album>.error('error');
  }
}
