import 'package:get/get.dart';
import 'package:tubes2_uas_kel3/data/vote/datasource/vote_datasource.dart';
import 'package:tubes2_uas_kel3/data/vote/responsesmodel/vote_responses_model_get.dart';

class VoteController extends GetxController {
  final VoteDatasource _datasource = VoteDatasource();
  RxList<VoteResponsesModelGet> vote = <VoteResponsesModelGet>[].obs;
  RxList<VoteResponsesModelGet> searchResults = <VoteResponsesModelGet>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchVote();
  }

  Future<void> fetchVote() async {
    isLoading.value = true;
    try {
      final result = await _datasource.getVote();
      if (result != null) {
        vote.value = result;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void searchVote(String query) {
    if (query.isEmpty) {
      searchResults.value = vote;
    } else {
      searchResults.value = vote
          .where((element) =>
              element.id.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  Future<void> deleteVote(int id) async {
    try {
      final result = await _datasource.deleteVote(id);
      if (result != null) {
        vote.removeWhere((element) => element.id == id);
        searchResults.removeWhere((element) => element.id == id);
      }
    } catch (e) {
      PrintLog.printLog("Error delete vote: $e");
    }
  }
}
