import 'package:kuncie_music/core.dart';

abstract class IAlbumProvider {
  Future<Response<Album>> getTopAlbums(String path);
  Future<Response<Album>> getArtistAlbums(String path);
}

class AlbumProvider extends GetConnect implements IAlbumProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiString.itunesURL;
    httpClient.defaultContentType = "text/javascript; charset=utf-8";
    httpClient.defaultDecoder = Album.fromJson;
    httpClient.timeout = const Duration(seconds: 30);
  }

  @override
  Future<Response<Album>> getTopAlbums(String path) => get(path);

  @override
  Future<Response<Album>> getArtistAlbums(String path) => get(path);
}
