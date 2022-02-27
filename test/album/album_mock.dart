import 'package:kuncie_music/core.dart';
import 'data/artist_albums.dart';
import 'data/top_4_albums.dart';

class MockRepositorySuccess implements IAlbumRepository {
  @override
  Future<Album> getTopAlbums() async {
    var album = Album.fromMap(top4Albums);
    album.items
        ?.removeWhere((item) => item.collectionType?.toLowerCase() != "album");
    return album;
  }

  @override
  Future<Album> getArtistAlbums(String artistId) async =>
      Album.fromMap(artistAlbums);
}

class MockRepositoryFailure implements IAlbumRepository {
  @override
  Future<Album> getTopAlbums() async => Future<Album>.error('error');

  @override
  Future<Album> getArtistAlbums(String artistId) async => Album();
}
