
import 'dart:convert'; // Untuk memproses JSON

// Fungsi untuk mem-parsing JSON string menjadi objek FavouritesResponsesModelDelete
FavouritesResponsesModelDelete favouritesResponsesModelDeleteFromJson(String str) => 
    FavouritesResponsesModelDelete.fromJson(json.decode(str));

// Fungsi untuk mengubah objek FavouritesResponsesModelDelete menjadi JSON string
String favouritesResponsesModelDeleteToJson(FavouritesResponsesModelDelete data) => 
    json.encode(data.toJson());

// Model data untuk FavouritesResponsesModelDelete
class FavouritesResponsesModelDelete {
  final String message;

  // Konstruktor dengan parameter wajib (required)
  FavouritesResponsesModelDelete({
    required this.message,
  });

  // Factory method untuk membuat instance dari JSON map
  factory FavouritesResponsesModelDelete.fromJson(Map<String, dynamic> json) => 
      FavouritesResponsesModelDelete(
        message: json["message"] ?? "", // Fallback jika message null
      );

  // Method untuk mengubah objek menjadi JSON map
  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
