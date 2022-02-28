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
    // httpClient.defaultContentType = "text/javascript; charset=utf-8";
    httpClient.defaultDecoder = Song.fromJson;
    httpClient.timeout = const Duration(seconds: 30);
  }

  @override
  Future<Response<Song>> getRecentTopSongs(String path) => get(path, headers: {
        // Required for CORS support to work
        "Access-Control-Allow-Origin": "*",
        // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Credentials": "true",
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      });

  @override
  Future<Response<Song>> getSearchArtistSongs(String path) => get(path);

  @override
  Future<Response<Song>> getArtistSongs(String path) => get(path);
}
