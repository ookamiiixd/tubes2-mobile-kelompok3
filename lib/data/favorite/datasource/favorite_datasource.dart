import 'package:tubes2-mobile-kelompok3/core/api_services/dio_module.dart';
import 'package:tubes2-mobile-kelompok3/core/api_services/endpoint.dart';
import 'package:tubes2-mobile-kelompok3/data/favorite/responsesmodel/favorite_responses_model_delete.dart';
import 'package:tubes2-mobile-kelompok3/data/favorite/responsesmodel/favorite_responses_model_get.dart';
import 'package:tubes2-mobile-kelompok3/data/favorite/responsesmodel/favorite_responses_model_post.dart';
import 'package:tubes2-mobile-kelompok3/data/favorite/requestsmodel/favorite_requests_model.dart';

class FavoriteDatasource {
  final HttpManager httpManager = HttpManager();

  Future<List<FavouritesResponsesModelGet>> getFavourites() async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.favoriteGetEndpoint,
        method: HttpMethods.get,
        useAuth: true,
      );

      if (response['statusCode'] == 200) {
        final List<dynamic> data = response['data'];
        return data
            .map((item) => FavouritesResponsesModelGet.fromJson(item))
            .toList();
      } else {
        throw Exception(
            'Failed to load favourites: ${response['statusMessage']}');
      }
    } catch (e) {
      throw Exception('Failed to load favourites: $e');
    }
  }

  Future<FavouritesResponsesModelPost?> createFavourites(
      FavoriteRequestsModel data) async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.favoriteGetEndpoint,
        method: HttpMethods.post,
        useAuth: true,
        body: data.toJson(),
      );

      if (response['statusCode'] == 200) {
        return FavouritesResponsesModelPost.fromJson(response['data']);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to create favourites: $e');
    }
  }

  Future<FavouritesResponsesModelDelete?> deleteFavourites(
      int favoriteId) async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.favByIdGetEndpoint(favoriteId),
        method: HttpMethods.delete,
        useAuth: true,
      );

      final message = response['message'];
      final statusMessage = response['statusMessage'];

      if (message == 'SUCCESS' || statusMessage == "OK") {
        if (response['data'] != null &&
            response['data'] is Map<String, dynamic>) {
          return FavouritesResponsesModelDelete.fromJson(response['data']);
        } else {
          return FavouritesResponsesModelDelete(
              message: message ?? "SUCCESS");
        }
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to delete favourites: $e');
    }
  }
}
