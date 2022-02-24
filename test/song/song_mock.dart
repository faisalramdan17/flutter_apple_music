import 'dart:math';
import 'package:kuncie_music/core.dart';
import 'data/artist_songs.dart';
import 'data/most_recent_songs.dart';
import 'data/search_artist_songs.dart';

class MockRepository implements ISongRepository {
  @override
  Future<Song> get7MostRecentSongs() async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (Random().nextBool()) {
      return Song.fromJson(mostRecentSongs);
    }

    return Future<Song>.error('error');
  }

  @override
  Future<Song> getSearchArtistSongs(String searchText) async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (Random().nextBool()) {
      return Song.fromJson(searchArtistSongs);
    }

    return Future<Song>.error('error');
  }

  @override
  Future<Song> getArtistSongs(String artistId) async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (Random().nextBool()) {
      return Song.fromJson(artistSongs);
    }

    return Future<Song>.error('error');
  }
}
