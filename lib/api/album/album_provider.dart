import 'package:kuncie_music/core.dart';

abstract class IAlbumProvider {
  Future<Response<Album>> getTopAlbums(String path);
  Future<Response<Album>> getArtistAlbums(String path);
}

class AlbumProvider extends GetConnect implements IAlbumProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiString.itunesURL;
    // httpClient.defaultContentType = "text/javascript; charset=utf-8";
    httpClient.defaultDecoder = Album.fromJson;
    httpClient.timeout = const Duration(seconds: 30);
  }

  @override
  Future<Response<Album>> getTopAlbums(String path) => get(path, headers: {
        // Required for CORS support to work
        "Access-Control-Allow-Origin": "*",
        // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Credentials": "true",
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      });

  @override
  Future<Response<Album>> getArtistAlbums(String path) => get(path);
}
