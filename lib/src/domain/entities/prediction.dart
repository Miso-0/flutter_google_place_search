import 'package:flutter_google_place_search/src/data/models/prediction_model.dart';
import 'matched_substring.dart';
import 'structured_formatting.dart';
import 'term.dart';

class Prediction {
  String? description;
  List<MatchedSubstring>? matchedSubstrings;
  String? placeId;
  String? reference;
  double? distanceMeters;
  StructuredFormatting? structuredFormatting;
  List<Term>? terms;
  List<String>? types;

  Prediction({
    this.placeId,
    this.reference,
    this.distanceMeters,
    this.description,
    this.matchedSubstrings,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  factory Prediction.fromModel(PredictionModel model) {
    return Prediction(
      description: model.description,
      matchedSubstrings: model.matchedSubstringModels
          ?.map((e) => MatchedSubstring.fromModel(e))
          .toList(),
      placeId: model.placeId,
      reference: model.reference,
      structuredFormatting: model.structuredFormattingModel != null
          ? StructuredFormatting.fromModel(model.structuredFormattingModel!)
          : null,
      terms: model.termModels?.map((e) => Term.fromModel(e)).toList(),
      types: model.types,
      distanceMeters: model.distanceMeters,
    );
  }
}
