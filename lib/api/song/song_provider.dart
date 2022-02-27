import 'package:kuncie_music/core.dart';

abstract class ISongProvider {
  Future<Response<Song>> getRecentTopSongs(String path);
  Future<Response<Song>> getSearchArtistSongs(String path);
  Future<Response<Song>> getArtistSongs(String path);
}

class SongProvider extends GetConnect implements ISongProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiString.itunesURL;
    httpClient.defaultContentType = "text/javascript; charset=utf-8";
    httpClient.defaultDecoder = Song.fromJson;
    httpClient.timeout = const Duration(seconds: 30);
  }

  @override
  Future<Response<Song>> getRecentTopSongs(String path) => get(path);

  @override
  Future<Response<Song>> getSearchArtistSongs(String path) => get(path);

  @override
  Future<Response<Song>> getArtistSongs(String path) => get(path);
}
