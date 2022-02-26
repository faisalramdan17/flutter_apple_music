import 'package:kuncie_music/core.dart';
import 'data/artist_songs.dart';
import 'data/most_recent_songs.dart';
import 'data/search_artist_songs.dart';

class MockRepositorySuccess implements ISongRepository {
  @override
  Future<Song> getRecentTopSongs() async {
    var song = Song.fromMap(mostRecentSongs);
    song.items?.removeWhere((item) => item.kind?.toLowerCase() != "song");
    return song;
  }

  @override
  Future<Song> getSearchArtistSongs(String searchText) async =>
      Song.fromMap(searchArtistSongs);

  @override
  Future<Song> getArtistSongs(String artistId) async =>
      Song.fromMap(artistSongs);
}

class MockRepositoryFailure implements ISongRepository {
  @override
  Future<Song> getRecentTopSongs() async => Future<Song>.error('error');

  @override
  Future<Song> getArtistSongs(String artistId) async =>
      Future<Song>.error('error');

  @override
  Future<Song> getSearchArtistSongs(String searchText) async =>
      Future<Song>.error('error');
}
