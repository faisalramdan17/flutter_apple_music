// To parse this JSON data, do
//
// final responseLookup = responseLookupFromMap(jsonString);

import 'dart:convert';

class Album {
  Album({
    this.resultCount,
    this.items,
  });

  final int? resultCount;
  final List<AlbumItem>? items;

  Album copyWith({
    int? resultCount,
    List<AlbumItem>? items,
  }) =>
      Album(
        resultCount: resultCount ?? this.resultCount,
        items: items ?? this.items,
      );

  factory Album.fromJson(dynamic str) => Album.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Album.fromMap(dynamic json) => Album(
        resultCount: json["resultCount"],
        items: json["results"] == null
            ? null
            : List<AlbumItem>.from(
                json["results"].map((x) => AlbumItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "resultCount": resultCount,
        "results": items == null
            ? null
            : List<dynamic>.from(items?.map((x) => x.toMap()) ?? []),
      };
}

class AlbumItem {
  AlbumItem({
    this.wrapperType,
    this.collectionType,
    this.artistId,
    this.collectionId,
    this.amgArtistId,
    this.artistName,
    this.collectionName,
    this.collectionCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.collectionExplicitness,
    this.trackCount,
    this.copyright,
    this.country,
    this.currency,
    this.releaseDate,
    this.primaryGenreName,
  });

  final String? wrapperType;
  final String? collectionType;
  final int? artistId;
  final int? collectionId;
  final int? amgArtistId;
  final String? artistName;
  final String? collectionName;
  final String? collectionCensoredName;
  final String? artistViewUrl;
  final String? collectionViewUrl;
  final String? artworkUrl60;
  final String? artworkUrl100;
  final double? collectionPrice;
  final String? collectionExplicitness;
  final int? trackCount;
  final String? copyright;
  final String? country;
  final String? currency;
  final DateTime? releaseDate;
  final String? primaryGenreName;

  AlbumItem copyWith({
    String? wrapperType,
    String? collectionType,
    int? artistId,
    int? collectionId,
    int? amgArtistId,
    String? artistName,
    String? collectionName,
    String? collectionCensoredName,
    String? artistViewUrl,
    String? collectionViewUrl,
    String? artworkUrl60,
    String? artworkUrl100,
    double? collectionPrice,
    String? collectionExplicitness,
    int? trackCount,
    String? copyright,
    String? country,
    String? currency,
    DateTime? releaseDate,
    String? primaryGenreName,
  }) =>
      AlbumItem(
        wrapperType: wrapperType ?? this.wrapperType,
        collectionType: collectionType ?? this.collectionType,
        artistId: artistId ?? this.artistId,
        collectionId: collectionId ?? this.collectionId,
        amgArtistId: amgArtistId ?? this.amgArtistId,
        artistName: artistName ?? this.artistName,
        collectionName: collectionName ?? this.collectionName,
        collectionCensoredName:
            collectionCensoredName ?? this.collectionCensoredName,
        artistViewUrl: artistViewUrl ?? this.artistViewUrl,
        collectionViewUrl: collectionViewUrl ?? this.collectionViewUrl,
        artworkUrl60: artworkUrl60 ?? this.artworkUrl60,
        artworkUrl100: artworkUrl100 ?? this.artworkUrl100,
        collectionPrice: collectionPrice ?? this.collectionPrice,
        collectionExplicitness:
            collectionExplicitness ?? this.collectionExplicitness,
        trackCount: trackCount ?? this.trackCount,
        copyright: copyright ?? this.copyright,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        releaseDate: releaseDate ?? this.releaseDate,
        primaryGenreName: primaryGenreName ?? this.primaryGenreName,
      );

  factory AlbumItem.fromJson(String str) => AlbumItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AlbumItem.fromMap(Map<String, dynamic> json) => AlbumItem(
        wrapperType: json["wrapperType"],
        collectionType: json["collectionType"],
        artistId: json["artistId"],
        collectionId: json["collectionId"],
        amgArtistId: json["amgArtistId"],
        artistName: json["artistName"],
        collectionName: json["collectionName"],
        collectionCensoredName: json["collectionCensoredName"],
        artistViewUrl: json["artistViewUrl"],
        collectionViewUrl: json["collectionViewUrl"],
        artworkUrl60: json["artworkUrl60"],
        artworkUrl100: json["artworkUrl100"],
        collectionPrice: json["collectionPrice"]?.toDouble(),
        // json["collectionPrice"] == null
        //     ? null
        //     : json["collectionPrice"].toDouble(),
        collectionExplicitness: json["collectionExplicitness"],
        trackCount: json["trackCount"],
        copyright: json["copyright"],
        country: json["country"],
        currency: json["currency"],
        releaseDate: json["releaseDate"] == null
            ? null
            : DateTime?.parse(json["releaseDate"]),
        primaryGenreName: json["primaryGenreName"],
      );

  Map<String, dynamic> toMap() => {
        "wrapperType": wrapperType,
        "collectionType": collectionType,
        "artistId": artistId,
        "collectionId": collectionId,
        "amgArtistId": amgArtistId,
        "artistName": artistName,
        "collectionName": collectionName,
        "collectionCensoredName": collectionCensoredName,
        "artistViewUrl": artistViewUrl,
        "collectionViewUrl": collectionViewUrl,
        "artworkUrl60": artworkUrl60,
        "artworkUrl100": artworkUrl100,
        "collectionPrice": collectionPrice,
        "collectionExplicitness": collectionExplicitness,
        "trackCount": trackCount,
        "copyright": copyright,
        "country": country,
        "currency": currency,
        "releaseDate": releaseDate?.toIso8601String(),
        // releaseDate == null ? null : releaseDate?.toIso8601String(),
        "primaryGenreName": primaryGenreName,
      };
}
