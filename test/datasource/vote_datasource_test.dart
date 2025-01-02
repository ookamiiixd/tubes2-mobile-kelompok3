import 'package:flutter_test/flutter_test.dart';
import 'package:tubes2_uas_kelompok6/data/breeds/datasource/breeds_datasource.dart';
import 'package:tubes2_uas_kelompok6/data/favorite/datasource/favorite_datasource.dart';
import 'package:tubes2_uas_kelompok6/data/vote/datasource/vote_datasource.dart';
import 'package:tubes2_uas_kelompok6/data/vote/requestsmodel/vote_requests_model.dart';

void main() {
  group('Vote Datasource test', () {
    late VoteDatasource voteDatasource;

    setUp(() {
      voteDatasource = VoteDatasource();
    });

    test('get Vote return correct data when successfully', () async {
      final response = await voteDatasource.getVote();

      expect(response.length, greaterThan(0));
      expect(response[0].id, isNotNull);
    });

    test('create Vote return correct data when successfully', () async {
      final voteReqModel = VoteRequestModel(
        imageId: 'aege',
        subId: 'fauzan_1444',
        value: 1,
      );

      final response = await voteDatasource.createVote(voteReqModel);

      if (response != null) {
        expect(response.message, equals("SUCCESS"));
      } else {
        fail('response is null');
      }
    });

 test('search Vote return correct data when succesfully', () async {
      final voteId = 232501209;

      final response = await voteDatasource.searchVote(voteId);

      if (response != null) {
        expect(response.id, equals(favoriteId));
      } else {
        fail('response is null');
      }
    });

test('Delete vote return correct data when succesfully', () async {
      final voteId = 232501209;

      final response = await voteDatasource.deleteVote(voteId);

        expect(response.id, equals(favoriteId));
      });
    });
}