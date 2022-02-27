import 'package:kuncie_music/core.dart';

abstract class IArtistProvider {
  Future<Response<Artist>> getArtist(String path);
}

class ArtistProvider extends GetConnect implements IArtistProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiString.itunesURL;
    httpClient.defaultDecoder = Artist.fromJson;
    httpClient.timeout = const Duration(seconds: 30);
  }

  @override
  Future<Response<Artist>> getArtist(String path) => get(path);
}
