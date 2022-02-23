import 'package:kuncie_music/core.dart';
import 'package:flutter/foundation.dart';

abstract class IArtistRepository {
  Future<Artist> getArtist(String artistId);
}

class ArtistRepository implements IArtistRepository {
  ArtistRepository({required this.provider});
  final IArtistProvider provider;

  @override
  Future<Artist> getArtist(String artistId) async {
    final responseArtist = await provider.getArtist("/lookup?id=$artistId");

    if (responseArtist.status.hasError) {
      debugPrint("ERROR = ${responseArtist.statusText!}");
      return Future.error(responseArtist.statusText!);
    } else {
      return responseArtist.body!;
    }
  }
}
