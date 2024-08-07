import 'package:flutter_assignment/core/api_response.dart';
import 'package:flutter_assignment/core/dependencies.dart';
import 'package:flutter_assignment/data_sources/remote_data_source.dart';
import 'package:flutter_assignment/model/home_model.dart';
import 'package:flutter_assignment/viewModel/home_viewModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_viewModel_test.mocks.dart';

@GenerateMocks([RemoteDataSource])

Future<void> main() async {
  late final RemoteDataSource remoteRepoTest;
  late final HomeViewModel viewModel;

  setUpAll(() {
    setup();
    remoteRepoTest = MockRemoteDataSource();
    viewModel = HomeViewModel(remoteDataSource: remoteRepoTest);
  });

  group("Testing the View Model", () {
    test('Fetching the data in view model', () async {
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

      when(remoteRepoTest.getData("1")).thenAnswer((_) async {
        return model;
      });

      await viewModel.getData("1");

      expect(viewModel.getVMData.it, 1);
    });

    test("Getting the data from the repo::", () async {
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

      when(remoteRepoTest.getData("1")).thenAnswer((_) async {
        return model;
      });

      final res = await remoteRepoTest.getData("1");

      expect(viewModel.getVMData.it, RemoteModel.fromJson(res.result).it);
    });
  });
}
