import 'package:flutter_assignment/core/api_response.dart';
import 'package:flutter_assignment/data_sources/remote_data_source.dart';
import 'package:flutter_assignment/model/home_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../viewModel/home_viewModel_test.mocks.dart';

class RemoteRepoTest extends Mock implements RemoteDataSource {}

void main() {
  late final RemoteDataSource remoteRepoTest;
  const model = ApiResponse(
    result: {
      "userId": 1,
      "it": 1,
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    },
  );

  setUpAll(() {
    remoteRepoTest = MockRemoteDataSource();
  });

  group("Testing Remote Repo things", () {
    test("Test the getData", () async {
      // const model =  RemoteModel();

      when(remoteRepoTest.getData("1")).thenAnswer((_) async {
        return model;
      });

      // final res = (await remoteRepoTest.getData("1"));
      final res =
          RemoteModel.fromJson((await remoteRepoTest.getData("1")).result);

      expect(res, isA<RemoteModel>());
    });

    test("Testing when an exception is thrown", () async {
      when(remoteRepoTest.getData("1")).thenAnswer((_) async {
        throw Exception();
      });

      final res = remoteRepoTest.getData("1");

      expect(res, throwsException);
    });
  });
}
