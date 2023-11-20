import 'matched_substring_model.dart';
import 'structured_formatting_model.dart';
import 'term_model.dart';

class PredictionModel {
  String? description;
  List<MatchedSubstringModel>? matchedSubstringModels;
  String? placeId;
  String? reference;
  double? distanceMeters;
  StructuredFormattingModel? structuredFormattingModel;
  List<TermModel>? termModels;
  List<String>? types;

  PredictionModel({
    this.placeId,
    this.reference,
    this.distanceMeters,
    this.description,
    this.matchedSubstringModels,
    this.structuredFormattingModel,
    this.termModels,
    this.types,
  });

  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
      description: json['description'],
      matchedSubstringModels: json['matched_substrings'] != null
          ? (json['matched_substrings'] as List)
              .map((i) => MatchedSubstringModel.fromJson(i))
              .toList()
          : null,
      placeId: json['place_id'],
      reference: json['reference'],
      structuredFormattingModel: json['structured_formatting'] != null
          ? StructuredFormattingModel.fromJson(json['structured_formatting'])
          : null,
      termModels: json['termModels'] != null
          ? (json['termModels'] as List)
              .map((i) => TermModel.fromJson(i))
              .toList()
          : null,
      types: json['types']?.cast<String>(),
      distanceMeters: json['distance_meters']?.toDouble(),
    );
  }
}
