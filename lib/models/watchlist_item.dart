// To parse this JSON data, do
//
//     final watchListItem = watchListItemFromJson(jsonString);

import 'dart:convert';

List<WatchListItem> watchListFromJson(String str) => List<WatchListItem>.from(
    json.decode(str).map((x) => WatchListItem.fromJson(x)));

String watchListToJson(List<WatchListItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchListItem {
  WatchListItem({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory WatchListItem.fromJson(Map<String, dynamic> json) => WatchListItem(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse?[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.title,
    required this.watched,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  String title;
  bool watched;
  int rating;
  DateTime releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        watched: json["watched"],
        rating: json["rating"],
        releaseDate: DateTime.parse(json["release_date"]),
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "watched": watched,
        "rating": rating,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "review": review,
      };
}

enum Model { MYWATCHLIST_MYWATCHLIST }

final modelValues =
    EnumValues({"mywatchlist.mywatchlist": Model.MYWATCHLIST_MYWATCHLIST});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
