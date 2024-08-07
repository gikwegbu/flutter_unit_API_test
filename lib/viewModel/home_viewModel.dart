import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/api_response.dart';
import 'package:flutter_assignment/data_sources/remote_data_source.dart';
import 'package:flutter_assignment/model/home_model.dart';

class HomeViewModel extends ChangeNotifier {
  final RemoteDataSource remoteDataSource;

  HomeViewModel({required this.remoteDataSource});

  // Variables
  bool _isLoading = false;
  RemoteModel _data = const RemoteModel();
  String? _errorMsg;

  // Getters
  bool get isLoading => _isLoading;
  RemoteModel get getVMData => _data;
  String? get getErrorMsg => _errorMsg;

  // Setters
  void setIsLoading(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  void setErrorMsg(String msg) {
    _errorMsg = msg;
    notifyListeners();
  }

  void setData(RemoteModel data) {
    _data = data;
    notifyListeners();
  }

  // Functions
  Future<void> getData(String id) async {
    setIsLoading(true);
    try {
      final res = await remoteDataSource.getData(id);
      setIsLoading(false);
      if (res.isError == true) {
        // Show error here...
        setErrorMsg(res.message);
        return;
      }
      final data = RemoteModel.fromJson(res.result);
      setData(data);
    } catch (error) {
      setIsLoading(false);
      setErrorMsg(error.toString());
    }
  }
}
