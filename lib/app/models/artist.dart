// To parse this JSON data, do
//
//     final artist = artistFromMap(jsonString);

import 'dart:convert';

class Artist {
  Artist({
    this.resultCount,
    this.results,
  });

  final int? resultCount;
  final List<ArtistItem>? results;

  Artist copyWith({
    int? resultCount,
    List<ArtistItem>? results,
  }) =>
      Artist(
        resultCount: resultCount ?? this.resultCount,
        results: results ?? this.results,
      );

  factory Artist.fromJson(dynamic str) => Artist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Artist.fromMap(dynamic json) => Artist(
        resultCount: json["resultCount"],
        results: json["results"] == null
            ? null
            : List<ArtistItem>.from(
                json["results"]?.map((x) => ArtistItem.fromMap(x)) ?? []),
      );

  Map<String, dynamic> toMap() => {
        "resultCount": resultCount,
        "results": results == null
            ? null
            : List<dynamic>.from(results?.map((x) => x.toMap()) ?? []),
      };
}

class ArtistItem {
  ArtistItem({
    this.wrapperType,
    this.artistType,
    this.artistName,
    this.artistLinkUrl,
    this.artistId,
    this.amgArtistId,
    this.primaryGenreName,
    this.primaryGenreId,
  });

  final String? wrapperType;
  final String? artistType;
  final String? artistName;
  final String? artistLinkUrl;
  final int? artistId;
  final int? amgArtistId;
  final String? primaryGenreName;
  final int? primaryGenreId;

  ArtistItem copyWith({
    String? wrapperType,
    String? artistType,
    String? artistName,
    String? artistLinkUrl,
    int? artistId,
    int? amgArtistId,
    String? primaryGenreName,
    int? primaryGenreId,
  }) =>
      ArtistItem(
        wrapperType: wrapperType ?? this.wrapperType,
        artistType: artistType ?? this.artistType,
        artistName: artistName ?? this.artistName,
        artistLinkUrl: artistLinkUrl ?? this.artistLinkUrl,
        artistId: artistId ?? this.artistId,
        amgArtistId: amgArtistId ?? this.amgArtistId,
        primaryGenreName: primaryGenreName ?? this.primaryGenreName,
        primaryGenreId: primaryGenreId ?? this.primaryGenreId,
      );

  factory ArtistItem.fromJson(String str) =>
      ArtistItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArtistItem.fromMap(Map<String, dynamic> json) => ArtistItem(
        wrapperType: json["wrapperType"],
        artistType: json["artistType"],
        artistName: json["artistName"],
        artistLinkUrl: json["artistLinkUrl"],
        artistId: json["artistId"],
        amgArtistId: json["amgArtistId"],
        primaryGenreName: json["primaryGenreName"],
        primaryGenreId: json["primaryGenreId"],
      );

  Map<String, dynamic> toMap() => {
        "wrapperType": wrapperType,
        "artistType": artistType,
        "artistName": artistName,
        "artistLinkUrl": artistLinkUrl,
        "artistId": artistId,
        "amgArtistId": amgArtistId,
        "primaryGenreName": primaryGenreName,
        "primaryGenreId": primaryGenreId,
      };
}
