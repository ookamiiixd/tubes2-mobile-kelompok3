import 'package:tubes2_mobile_kelompok3/core/api_services/http_manager.dart';
import 'package:tubes2_mobile_kelompok3/core/api_services/api_constants.dart';
import 'package:tubes2_mobile_kelompok3/data/favorite/responses_model/favorite_responses_model_get.dart';
import 'package:tubes2_mobile_kelompok3/data/favorite/requests_model/favorite_requests_model.dart';

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
            .map<FavouritesResponsesModelGet>(
                (dynamic item) => FavouritesResponsesModelGet.fromJson(item))
            .toList();
      } else {
        throw Exception(
            'Failed to load favourites: ${response['statusMessage']}');
      }
    } catch (e) {
      throw Exception(message: 'Failed to load favourites: $e');
    }
  }

  Future<FavouritesResponsesModelPost> createFavourites(
      FavoriteRequestsModel requestModel) async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.favoritePostEndpoint,
        method: HttpMethods.post,
        body: requestModel.toJson(),
        useAuth: true,
      );

      if (response['statusCode'] == 200) {
        return FavouritesResponsesModelPost.fromJson(response['data']);
      } else {
        throw Exception(
            'Failed to create favourite: ${response['statusMessage']}');
      }
    } catch (e) {
      throw Exception(message: 'Failed to create favourite: $e');
    }
  }
}
