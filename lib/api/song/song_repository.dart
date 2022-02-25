import 'package:kuncie_music/core.dart';
import 'package:flutter/foundation.dart';

abstract class ISongRepository {
  Future<Song> get7MostRecentSongs();
  Future<Song> getSearchArtistSongs(String searchText);
  Future<Song> getArtistSongs(String artistId);
}

class SongRepository implements ISongRepository {
  SongRepository({required this.provider});
  final ISongProvider provider;

  @override
  Future<Song> get7MostRecentSongs() async {
    const String entity = "song";
    const String id =
        "320569549, 1062085272, 13493906, 941107698, 463996386, 206384513, 126411124";

    final responseSong = await provider.get7MostRecentSongs(
        "/lookup?id=$id&entity=$entity&limit=1&sort=recent");

    responseSong.body!.items
        ?.removeWhere((item) => item.kind?.toLowerCase() != "song");

    if (responseSong.status.hasError) {
      debugPrint("ERROR = ${responseSong.statusText!}");
      return Future.error(responseSong.statusText!);
    } else {
      return responseSong.body!;
    }
  }

  @override
  Future<Song> getSearchArtistSongs(String searchText) async {
    const String entity = "song";
    const String attribute = "allArtistTerm";

    final responseSearch = await provider.getSearchArtistSongs(
        "/search?term=$searchText&entity=$entity&attribute=$attribute");

    if (responseSearch.status.hasError) {
      debugPrint("ERROR = ${responseSearch.statusText!}");
      return Future.error(responseSearch.statusText!);
    } else {
      return responseSearch.body!;
    }
  }

  @override
  Future<Song> getArtistSongs(String artistId) async {
    final responseSong = await provider
        .getArtistSongs("/lookup?id=$artistId&entity=song&sort=recent");

    responseSong.body!.items
        ?.removeWhere((item) => item.kind?.toLowerCase() != "song");

    if (responseSong.status.hasError) {
      debugPrint("ERROR = ${responseSong.statusText!}");
      return Future.error(responseSong.statusText!);
    } else {
      return responseSong.body!;
    }
  }
}
