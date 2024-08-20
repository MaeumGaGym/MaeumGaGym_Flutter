import 'package:maeumgagym_flutter/domain/quotes/entity/quotes_entity.dart';

class QuotesDto {
  final String message;
  final String author;

  QuotesDto({required this.message, required this.author,});

  factory QuotesDto.fromJson(Map<String, dynamic> json) {
    return QuotesDto(
      message: json['quote'],
      author: json['quoter'],
    );
  }

  QuotesEntity toEntity(){
    return QuotesEntity(
      message: message,
      author: author,
    );
  }
}