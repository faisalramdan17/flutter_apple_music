import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

abstract class IAlbumProvider {
  Future<Response<Album>> getTop4Albums(String path);
  Future<Response<Album>> getAlbumsArtist(String path);
}

class AlbumProvider extends GetConnect implements IAlbumProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiString.itunesURL;
    httpClient.defaultDecoder = Album.fromMap;
  }

  @override
  Future<Response<Album>> getTop4Albums(String path) {
    return get(path);
  }

  @override
  Future<Response<Album>> getAlbumsArtist(String path) {
    return get(path);
  }
}
