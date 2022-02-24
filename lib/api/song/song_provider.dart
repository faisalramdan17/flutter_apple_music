import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

abstract class ISongProvider {
  Future<Response<Song>> get7MostRecentSongs(String path);
  Future<Response<Song>> getSearchArtistSongs(String path);
  Future<Response<Song>> getArtistSongs(String path);
}

class SongProvider extends GetConnect implements ISongProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiString.itunesURL;
    httpClient.defaultContentType = "text/javascript; charset=utf-8";
    httpClient.defaultDecoder = Song.fromJson;
  }

  @override
  Future<Response<Song>> get7MostRecentSongs(String path) {
    return get(path);
  }

  @override
  Future<Response<Song>> getSearchArtistSongs(String path) {
    return get(path);
  }

  @override
  Future<Response<Song>> getArtistSongs(String path) {
    return get(path);
  }
}
