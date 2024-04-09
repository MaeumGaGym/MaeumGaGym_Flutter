import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeQuotesModel {
  AsyncValue<int> statusCode;
  final String? message;
  final String? author;

  HomeQuotesModel(
      {required this.message, required this.author, required this.statusCode});

  factory HomeQuotesModel.fromJson(
    Map<String, dynamic> json,
    AsyncValue<int> statusCode,
  ) {
    return HomeQuotesModel(
      message: json['quote'],
      author: json['quoter'],
      statusCode: statusCode,
    );
  }

  HomeQuotesModel copyWith({
    AsyncValue<int>? statusCode,
    String? message,
    String? author,
  }) {
    return HomeQuotesModel(
      message: message ?? this.message,
      author: author ?? this.author,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
