// To parse this JSON data, do
//
//     final favouritesResponsesModelDelete = favouritesResponsesModelDeleteFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FavouritesResponsesModelDelete favouritesResponsesModelDeleteFromJson(String str) => FavouritesResponsesModelDelete.fromJson(json.decode(str));

String favouritesResponsesModelDeleteToJson(FavouritesResponsesModelDelete data) => json.encode(data.toJson());

class FavouritesResponsesModelDelete {
    final String message;

    FavouritesResponsesModelDelete({
        required this.message,
    });

    factory FavouritesResponsesModelDelete.fromJson(Map<String, dynamic> json) => FavouritesResponsesModelDelete(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}