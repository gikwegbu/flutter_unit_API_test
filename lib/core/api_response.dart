import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ApiResponse {
  final int? statusCode;
  final String message;
  final dynamic result;
  final String? status;
  final bool? isError;

  const ApiResponse({
    this.statusCode,
    this.message = '',
    this.result,
    this.status,
    this.isError,
    
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
      'result': result,
      'status': status,
      'isError': isError,
    };
  }

  ApiResponse copyWith({
    int? statusCode,
    String? message,
    dynamic result,
    String? status,
    bool? isError,
  }) {
    return ApiResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      result: result ?? this.result,
      status: status ?? this.status,
      isError: isError ?? this.isError,
    );
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      message: map['message'] ?? "",
      result: map['result'] as dynamic,
      status: map['status'] != null ? map['status'] as String : null,
      isError: map['isError'] != null ? map['isError'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) => ApiResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiResponse(statusCode: $statusCode, message: $message, result: $result, status: $status, isError: $isError)';
  }

  @override
  bool operator ==(covariant ApiResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.statusCode == statusCode &&
      other.message == message &&
      other.result == result &&
      other.status == status &&
      other.isError == isError;
  }

  @override
  int get hashCode {
    return statusCode.hashCode ^
      message.hashCode ^
      result.hashCode ^
      status.hashCode ^
      isError.hashCode;
  }
}
