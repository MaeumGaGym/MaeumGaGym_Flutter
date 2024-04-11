import 'package:flutter_riverpod/flutter_riverpod.dart';

class PoseTagListModel {
  final List<Responses>? responses;
  final AsyncValue<int> statusCode;

  PoseTagListModel({
    required this.responses,
    required this.statusCode,
  });

  factory PoseTagListModel.fromJson(
      Map<String, dynamic> json, int? statusCode) {
    return PoseTagListModel(
      responses: json['responses']
          .map<Responses>((item) => Responses.fromJson(item))
          .toList(),
      statusCode: AsyncData(statusCode!),
    );
  }

  PoseTagListModel copyWith({
    List<Responses>? responses,
    AsyncValue<int>? statusCode,
  }) {
    return PoseTagListModel(
      responses: responses ?? this.responses,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

class Responses {
  final int? id;
  final bool? needMachine;
  final String? name;
  final String? thumbnail;
  final List<String> simplePart; //

  Responses({
    required this.id,
    required this.thumbnail,
    required this.name,
    required this.needMachine,
    required this.simplePart,
  });

  factory Responses.fromJson(Map<String, dynamic> json) {
    return Responses(
      id: json['id'],
      thumbnail: json['thumbnail'],
      name: json['name'],
      needMachine: json['need_machine'],
      simplePart: List<String>.from(json['simple_part']),
    );
  }
}
