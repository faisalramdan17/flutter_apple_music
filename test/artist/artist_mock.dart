import 'dart:math';
import 'package:kuncie_music/core.dart';
import 'data/artist_profile.dart';

class MockRepository implements IArtistRepository {
  @override
  Future<Artist> getArtist(String artistId) async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (Random().nextBool()) {
      return Artist.fromJson(artistProfile);
    }

    return Future<Artist>.error('error');
  }
}
