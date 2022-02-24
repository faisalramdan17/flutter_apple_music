import 'package:kuncie_music/core.dart';
import 'data/artist_profile.dart';

class MockRepositorySuccess implements IArtistRepository {
  @override
  Future<Artist> getArtist(String artistId) async =>
      Artist.fromMap(artistProfile);
}

class MockRepositoryFailure implements IArtistRepository {
  @override
  Future<Artist> getArtist(String artistId) async =>
      Future<Artist>.error('error');
}
