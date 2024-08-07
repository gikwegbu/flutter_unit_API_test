import 'dart:io';
import 'dart:convert';

import 'package:flutter_assignment/core/api_response.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<ApiResponse> getData(String id);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<ApiResponse> getData(String id) async {
    try {
      final res = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));

      return ApiResponse(
        result: json.decode(res.body),
        statusCode: res.statusCode,
        message: res.statusCode != 200
            ? "Error fetching file"
            : "Fetched successfully",
        status: res.statusCode != 200 ? "failure" : "success",
        isError: res.statusCode != 200,
      );
    } on HttpException catch (e) {
      return ApiResponse(
        statusCode: 400,
        status: "failure",
        message: e.message,
        isError: true,
      );
    } catch (err) {
      print("This is the Error");
      return ApiResponse(
        status: "failure",
        statusCode: 400,
        message: err.toString(),
        isError: true,
      );
    }
  }
}
