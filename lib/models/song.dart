// To parse this JSON data, do
//
//  final responseSearch = responseSearchFromMap(jsonString);

import 'dart:convert';

class Song {
  Song({
    this.resultCount,
    this.items,
  });

  final int? resultCount;
  final List<SongItem>? items;

  Song copyWith({
    int? resultCount,
    List<SongItem>? items,
  }) =>
      Song(
        resultCount: resultCount ?? this.resultCount,
        items: items ?? this.items,
      );

  factory Song.fromJson(String str) => Song.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Song.fromMap(dynamic json) => Song(
        resultCount: json["resultCount"],
        items: json["results"] == null
            ? null
            : List<SongItem>.from(
                json["results"].map((x) => SongItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "resultCount": resultCount,
        "results": items == null
            ? null
            : List<dynamic>.from(items?.map((x) => x.toMap()) ?? []),
      };
}

class SongItem {
  SongItem({
    this.wrapperType,
    this.kind,
    this.artistId,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.discCount,
    this.discNumber,
    this.trackCount,
    this.trackNumber,
    this.trackTimeMillis,
    this.country,
    this.currency,
    this.primaryGenreName,
    this.isStreamable,
    this.collectionArtistId,
    this.collectionArtistViewUrl,
    this.trackRentalPrice,
    this.collectionHdPrice,
    this.trackHdPrice,
    this.trackHdRentalPrice,
    this.contentAdvisoryRating,
    this.shortDescription,
    this.longDescription,
    this.hasITunesExtras,
    this.collectionArtistName,
  });

  final String? wrapperType;
  final String? kind;
  final int? artistId;
  final int? collectionId;
  final int? trackId;
  final String? artistName;
  final String? collectionName;
  final String? trackName;
  final String? collectionCensoredName;
  final String? trackCensoredName;
  final String? artistViewUrl;
  final String? collectionViewUrl;
  final String? trackViewUrl;
  final String? previewUrl;
  final String? artworkUrl30;
  final String? artworkUrl60;
  final String? artworkUrl100;
  final double? collectionPrice;
  final double? trackPrice;
  final DateTime? releaseDate;
  final String? collectionExplicitness;
  final String? trackExplicitness;
  final int? discCount;
  final int? discNumber;
  final int? trackCount;
  final int? trackNumber;
  final int? trackTimeMillis;
  final String? country;
  final String? currency;
  final String? primaryGenreName;
  final bool? isStreamable;
  final int? collectionArtistId;
  final String? collectionArtistViewUrl;
  final double? trackRentalPrice;
  final double? collectionHdPrice;
  final double? trackHdPrice;
  final double? trackHdRentalPrice;
  final String? contentAdvisoryRating;
  final String? shortDescription;
  final String? longDescription;
  final bool? hasITunesExtras;
  final String? collectionArtistName;

  SongItem copyWith({
    String? wrapperType,
    String? kind,
    int? artistId,
    int? collectionId,
    int? trackId,
    String? artistName,
    String? collectionName,
    String? trackName,
    String? collectionCensoredName,
    String? trackCensoredName,
    String? artistViewUrl,
    String? collectionViewUrl,
    String? trackViewUrl,
    String? previewUrl,
    String? artworkUrl30,
    String? artworkUrl60,
    String? artworkUrl100,
    double? collectionPrice,
    double? trackPrice,
    DateTime? releaseDate,
    String? collectionExplicitness,
    String? trackExplicitness,
    int? discCount,
    int? discNumber,
    int? trackCount,
    int? trackNumber,
    int? trackTimeMillis,
    String? country,
    String? currency,
    String? primaryGenreName,
    bool? isStreamable,
    int? collectionArtistId,
    String? collectionArtistViewUrl,
    double? trackRentalPrice,
    double? collectionHdPrice,
    double? trackHdPrice,
    double? trackHdRentalPrice,
    String? contentAdvisoryRating,
    String? shortDescription,
    String? longDescription,
    bool? hasITunesExtras,
    String? collectionArtistName,
  }) =>
      SongItem(
        wrapperType: wrapperType ?? this.wrapperType,
        kind: kind ?? this.kind,
        artistId: artistId ?? this.artistId,
        collectionId: collectionId ?? this.collectionId,
        trackId: trackId ?? this.trackId,
        artistName: artistName ?? this.artistName,
        collectionName: collectionName ?? this.collectionName,
        trackName: trackName ?? this.trackName,
        collectionCensoredName:
            collectionCensoredName ?? this.collectionCensoredName,
        trackCensoredName: trackCensoredName ?? this.trackCensoredName,
        artistViewUrl: artistViewUrl ?? this.artistViewUrl,
        collectionViewUrl: collectionViewUrl ?? this.collectionViewUrl,
        trackViewUrl: trackViewUrl ?? this.trackViewUrl,
        previewUrl: previewUrl ?? this.previewUrl,
        artworkUrl30: artworkUrl30 ?? this.artworkUrl30,
        artworkUrl60: artworkUrl60 ?? this.artworkUrl60,
        artworkUrl100: artworkUrl100 ?? this.artworkUrl100,
        collectionPrice: collectionPrice ?? this.collectionPrice,
        trackPrice: trackPrice ?? this.trackPrice,
        releaseDate: releaseDate ?? this.releaseDate,
        collectionExplicitness:
            collectionExplicitness ?? this.collectionExplicitness,
        trackExplicitness: trackExplicitness ?? this.trackExplicitness,
        discCount: discCount ?? this.discCount,
        discNumber: discNumber ?? this.discNumber,
        trackCount: trackCount ?? this.trackCount,
        trackNumber: trackNumber ?? this.trackNumber,
        trackTimeMillis: trackTimeMillis ?? this.trackTimeMillis,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        primaryGenreName: primaryGenreName ?? this.primaryGenreName,
        isStreamable: isStreamable ?? this.isStreamable,
        collectionArtistId: collectionArtistId ?? this.collectionArtistId,
        collectionArtistViewUrl:
            collectionArtistViewUrl ?? this.collectionArtistViewUrl,
        trackRentalPrice: trackRentalPrice ?? this.trackRentalPrice,
        collectionHdPrice: collectionHdPrice ?? this.collectionHdPrice,
        trackHdPrice: trackHdPrice ?? this.trackHdPrice,
        trackHdRentalPrice: trackHdRentalPrice ?? this.trackHdRentalPrice,
        contentAdvisoryRating:
            contentAdvisoryRating ?? this.contentAdvisoryRating,
        shortDescription: shortDescription ?? this.shortDescription,
        longDescription: longDescription ?? this.longDescription,
        hasITunesExtras: hasITunesExtras ?? this.hasITunesExtras,
        collectionArtistName: collectionArtistName ?? this.collectionArtistName,
      );

  factory SongItem.fromJson(String str) => SongItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SongItem.fromMap(Map<String, dynamic> json) => SongItem(
        wrapperType: json["wrapperType"],
        kind: json["kind"],
        artistId: json["artistId"],
        collectionId: json["collectionId"],
        trackId: json["trackId"],
        artistName: json["artistName"],
        collectionName: json["collectionName"],
        trackName: json["trackName"],
        collectionCensoredName: json["collectionCensoredName"],
        trackCensoredName: json["trackCensoredName"],
        artistViewUrl: json["artistViewUrl"],
        collectionViewUrl: json["collectionViewUrl"],
        trackViewUrl: json["trackViewUrl"],
        previewUrl: json["previewUrl"],
        artworkUrl30: json["artworkUrl30"],
        artworkUrl60: json["artworkUrl60"],
        artworkUrl100: json["artworkUrl100"],
        collectionPrice: json["collectionPrice"]?.toDouble(),
        // json["collectionPrice"] == null
        //     ? null
        //     : json["collectionPrice"].toDouble(),
        trackPrice: json["trackPrice"]?.toDouble(),
        // json["trackPrice"] == null ? null : json["trackPrice"].toDouble(),
        releaseDate: json["releaseDate"] == null
            ? null
            : DateTime?.parse(json["releaseDate"]),
        collectionExplicitness: json["collectionExplicitness"],
        trackExplicitness: json["trackExplicitness"],
        discCount: json["discCount"],
        discNumber: json["discNumber"],
        trackCount: json["trackCount"],
        trackNumber: json["trackNumber"],
        trackTimeMillis: json["trackTimeMillis"],
        country: json["country"],
        currency: json["currency"],
        primaryGenreName: json["primaryGenreName"],
        isStreamable: json["isStreamable"],
        collectionArtistId: json["collectionArtistId"],
        collectionArtistViewUrl: json["collectionArtistViewUrl"],
        trackRentalPrice: json["trackRentalPrice"]?.toDouble(),
        // json["trackRentalPrice"] == null
        //     ? null
        //     : json["trackRentalPrice"].toDouble(),
        collectionHdPrice: json["collectionHdPrice"]?.toDouble(),
        // json["collectionHdPrice"] == null
        //     ? null
        //     : json["collectionHdPrice"].toDouble(),
        trackHdPrice: json["trackHdPrice"]?.toDouble(),
        // json["trackHdPrice"] == null
        //     ? null
        //     : json["trackHdPrice"].toDouble(),
        trackHdRentalPrice: json["trackHdRentalPrice"]?.toDouble(),
        // json["trackHdRentalPrice"] == null
        //     ? null
        //     : json["trackHdRentalPrice"].toDouble(),
        contentAdvisoryRating: json["contentAdvisoryRating"],
        shortDescription: json["shortDescription"],
        longDescription: json["longDescription"],
        hasITunesExtras: json["hasITunesExtras"],
        collectionArtistName: json["collectionArtistName"],
      );

  Map<String, dynamic> toMap() => {
        "wrapperType": wrapperType,
        "kind": kind,
        "artistId": artistId,
        "collectionId": collectionId,
        "trackId": trackId,
        "artistName": artistName,
        "collectionName": collectionName,
        "trackName": trackName,
        "collectionCensoredName": collectionCensoredName,
        "trackCensoredName": trackCensoredName,
        "artistViewUrl": artistViewUrl,
        "collectionViewUrl": collectionViewUrl,
        "trackViewUrl": trackViewUrl,
        "previewUrl": previewUrl,
        "artworkUrl30": artworkUrl30,
        "artworkUrl60": artworkUrl60,
        "artworkUrl100": artworkUrl100,
        "collectionPrice": collectionPrice,
        "trackPrice": trackPrice,
        "releaseDate": releaseDate?.toIso8601String(),
        // releaseDate == null ? null : releaseDate?.toIso8601String(),
        "collectionExplicitness": collectionExplicitness,
        "trackExplicitness": trackExplicitness,
        "discCount": discCount,
        "discNumber": discNumber,
        "trackCount": trackCount,
        "trackNumber": trackNumber,
        "trackTimeMillis": trackTimeMillis,
        "country": country,
        "currency": currency,
        "primaryGenreName": primaryGenreName,
        "isStreamable": isStreamable,
        "collectionArtistId": collectionArtistId,
        "collectionArtistViewUrl": collectionArtistViewUrl,
        "trackRentalPrice": trackRentalPrice,
        "collectionHdPrice": collectionHdPrice,
        "trackHdPrice": trackHdPrice,
        "trackHdRentalPrice": trackHdRentalPrice,
        "contentAdvisoryRating": contentAdvisoryRating,
        "shortDescription": shortDescription,
        "longDescription": longDescription,
        "hasITunesExtras": hasITunesExtras,
        "collectionArtistName": collectionArtistName,
      };
}
