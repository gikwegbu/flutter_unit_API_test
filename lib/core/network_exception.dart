


import 'package:flutter_assignment/core/api_response.dart';
import 'package:http/http.dart';

class NetworkException implements Exception {
  final dynamic msg;

  NetworkException([this.msg]);

  @override
  String toString() => "$msg";

  static ApiResponse errorHandler(Response  e) {
    if(e.contentLength == null) {
       ApiResponse response = ApiResponse.fromJson(e.body);
        return response;
    }
// If it gets to this part, means it did not hit the server at all...
    throw NetworkException(
      exceptionHandler( e.statusCode),
    );
  }
}

String exceptionHandler(int? statusCode) {
   if (statusCode == 401) {
    return "Something went wrong, Please log back in.";
  } else {
    return "Something went wrong, Please try again later!";
  }
}
