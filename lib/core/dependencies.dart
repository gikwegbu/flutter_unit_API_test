
import 'package:flutter_assignment/data_sources/remote_data_source.dart';
import 'package:flutter_assignment/viewModel/home_viewModel.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;


void setup() {


  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client: http.Client()));
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel(remoteDataSource: locator.get<RemoteDataSource>()));
}