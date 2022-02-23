import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

abstract class ISongProvider {
  Future<Response<Song>> get5MostRecentSongs(String path);
  Future<Response<Song>> getSearchArtistSongs(String path);
  Future<Response<Song>> getSongsArtist(String path);
}

class SongProvider extends GetConnect implements ISongProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiString.itunesURL;
    httpClient.defaultDecoder = Song.fromMap;
  }

  @override
  Future<Response<Song>> get5MostRecentSongs(String path) {
    return get(path);
  }

  @override
  Future<Response<Song>> getSearchArtistSongs(String path) {
    return get(path);
  }

  @override
  Future<Response<Song>> getSongsArtist(String path) {
    return get(path);
  }
}
