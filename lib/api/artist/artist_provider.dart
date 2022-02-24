import 'package:kuncie_music/core.dart';
import 'package:get/get.dart';

abstract class IArtistProvider {
  Future<Response<Artist>> getArtist(String path);
}

class ArtistProvider extends GetConnect implements IArtistProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiString.itunesURL;
    httpClient.defaultDecoder = Artist.fromJson;
  }

  @override
  Future<Response<Artist>> getArtist(String path) {
    return get(path);
  }
}
