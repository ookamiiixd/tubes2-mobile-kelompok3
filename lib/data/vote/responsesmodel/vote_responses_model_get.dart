// To parse this JSON data, do
//
//     final voteResponsesModalGet = voteResponsesModalGetFromJson(jsonString);

import 'dart:convert';

List<VoteResponsesModalGet> voteResponsesModalGetFromJson(String str) =>
    List<VoteResponsesModalGet>.from(
        json.decode(str).map((x) => VoteResponsesModalGet.fromJson(x)));

String voteResponsesModalGetToJson(List<VoteResponsesModalGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VoteResponsesModalGet {
  final int id;
  final String imageId;
  final String subId;
  final DateTime createdAt;
  final int value;
  final String countryCode;
  final Image image;

  VoteResponsesModalGet({
    required this.id,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.value,
    required this.countryCode,
    required this.image,
  });

  factory VoteResponsesModalGet.fromJson(Map<String, dynamic> json) =>
      VoteResponsesModalGet(
        id: json["id"],
        imageId: json["image_id"],
        subId: json["sub_id"],
        createdAt: DateTime.parse(json["created_at"]),
        value: json["value"],
        countryCode: json["country_code"],
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_id": imageId,
        "sub_id": subId,
        "created_at": createdAt.toIso8601String(),
        "value": value,
        "country_code": countryCode,
        "image": image.toJson(),
      };
}

class Image {
  Image();

  factory Image.fromJson(Map<String, dynamic> json) => Image();

  Map<String, dynamic> toJson() => {};
}
