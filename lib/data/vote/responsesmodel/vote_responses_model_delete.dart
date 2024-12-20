// To parse this JSON data, do
//
//     final voteResponsesModalDelete = voteResponsesModalDeleteFromJson(jsonString);

import 'dart:convert';

VoteResponsesModalDelete voteResponsesModalDeleteFromJson(String str) =>
    VoteResponsesModalDelete.fromJson(json.decode(str));

String voteResponsesModalDeleteToJson(VoteResponsesModalDelete data) =>
    json.encode(data.toJson());

class VoteResponsesModalDelete {
  final String message;

  VoteResponsesModalDelete({
    required this.message,
  });

  factory VoteResponsesModalDelete.fromJson(Map<String, dynamic> json) =>
      VoteResponsesModalDelete(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
