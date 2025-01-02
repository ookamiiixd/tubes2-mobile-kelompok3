// To parse this JSON data, do
//
//     final voteResponsesModalSearch = voteResponsesModalSearchFromJson(jsonString);

import 'dart:convert';

VoteResponsesModalSearch voteResponsesModalSearchFromJson(String str) =>
    VoteResponsesModalSearch.fromJson(json.decode(str));

String voteResponsesModalSearchToJson(VoteResponsesModalSearch data) =>
    json.encode(data.toJson());

class VoteResponsesModalSearch {
  final int id;
  final String userId;
  final String imageId;
  final String subId;
  final DateTime createdAt;
  final int value;
  final String countryCode;
  final Image image;

  VoteResponsesModalSearch({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.value,
    required this.countryCode,
    required this.image,
  });

  factory VoteResponsesModalSearch.fromJson(Map<String, dynamic> json) =>
      VoteResponsesModalSearch(
        id: json["id"],
        userId: json["user_id"],
        imageId: json["image_id"],
        subId: json["sub_id"],
        createdAt: DateTime.parse(json["created_at"]),
        value: json["value"],
        countryCode: json["country_code"],
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
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
