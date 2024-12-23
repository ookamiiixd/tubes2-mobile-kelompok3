// ignore: unused_import
import 'package:cat_app/core/utils/print_log.dart';
import '../../../core/api_services/dio_module.dart';
import '../../../core/api_services/endpoint.dart';
import '../requestsmodel/vote_requests_model.dart';
import '../responsesmodel/vote_responses_model.dart';
import '../responsesmodel/vote_responses_model_delete.dart';
import '../responsesmodel/vote_responses_model_get.dart';
import '../responsesmodel/vote_responses_model_post.dart';

class VoteDatasource {
  final HttpManager _httpManager = HttpManager();

  Future<List<VoteResponsesModelGet>> getVote() async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.voteGetEndpoint,
        method: HttpMethods.get,
        useAuth: true,
      );

      // PrintLog.printlog('getvote DataSource response: $response');

      // Check if the response contains the expected structure
      if (response['statusCode'] == 200 && response.containsKey('data')) {
        final List<dynamic> data = response['data'];

        // Map each item in the list to a VoteResponsesModelGet, handle missing
        return data.map((item) {
          if (item['image'] == null || item['image'].isEmpty) {
            item['image'] = {'id': '', 'url': ''}; // Default when image
          }
          return VoteResponsesModelGet.fromJson(item);
        }).toList();
      } else {
        throw Exception('Failed to load getVote: Invalid response format');
      }
    } catch (e) {
      // PrintLog.printlog('getVote DataSource error: $e');
      throw Exception('Failed to load getVote');
    }
  }

  Future<VoteResponsesModelPost?> createVote(voteRequestsModel data) async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.voteGetEndpoint,
        userAuth: true,
        method: HttpMethods.post, // Specify the HTTP method
        body: data.toJson(),
      );

      final statusCode = response['statusCode'];
      final statusMessage = response['statusMessage'];

      // Treat both 200 (OK) and 201 (Created) as success
      if (statusCode == 200 || statusCode == 201) {
        // Check if 'data' exists and is a valid map
        if (response['data'] != null &&
            response['data'] is Map<String, dynamic>) {
          // PrintLog.printlog(
          // 'createVote DataSource response: ${response['data']}');
          return VoteResponsesModelPost.fromJson(response['data']);
        } else {
          // If 'data' is absent, create a model with the status message
          // PrintLog.printLog(
          // 'createVote DataSource response data is null or invalid: $)
          return VoteResponseModelPost(
            message: statusMessage ?? "SUCCESS",
            id: 0, // Provide default or dummy values as per your model
            imageId: '',
            subId: '',
            value: 0,
            countryCode: '',
          );
        }
      } else {
        // PrintLog.printLog(
        // 'createVote DataSource failed: ${statusMessage ?? "Unknown "})
        return null;
      }
    } catch (e) {
      // PrintLog.printLog('createVote DataSource error: $e');
      return null;
    }
  }

  Future<VoteResponsesModelDelete?> deleteVote(int voteId) async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.voteByIdGetEndpoint(voteId),
        method: HttpMethods.delete,
        useAuth: true,
      );

      // Extract both 'message' and 'statusMessage' from the response
      final message = response['message'];
      final statusMessage = response['statusMessage'];

      // Determine if the response indicates success
      if (message == "SUCCESS" || statusMessage == "OK") {
        // Optionally handle 'data' if it's present
        if (response['data'] != null &&
            response['data'] is Map<String, dynamic>) {
          return VoteResponsesModelDelete.fromJson(response['data']);
        } else {
          // Map 'statusMessage' to 'message' in the model
          return VoteResponsesModelDelete(
            message: message ?? "SUCCESS",
          );
        }
      } else {
        // PrintLog.printLog(
        // 'deleteFavorite DataSource failed: $(statusMessage ?? "Unknown")
        // );
        return null;
      }
    } catch (e) {
      // PrintLog.printLog('deleteFavorite DataSource error: $e');
      return null;
    }
  }

// ignore: non_constant_identifier_names
  Future<VoteResponsesModelSearch?> searchVote(int vote_id) async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.voteByIdGetEndpoint(vote_id),
        useAuth: true,
        method: HttpMethods.get, // Specify the HTTP method
      );

      if (response['statusCode'] == 200) {
        // Print the response data for debugging if necessary
        // PrintLog.printLog(
        // 'searchVote DataSource response: $response['data'])');
        return VoteResponsesModelSearch.fromJson(response['data']);
      } else {
        // PrintLog.printLog(
        // 'searchVote DataSource failed: ${response['statusMessage']}');
        return null;
      }
    } catch (e) {
      // PrintLog.printLog('searchVote DataSource error: $e');
      return null;
    }
  }
}
