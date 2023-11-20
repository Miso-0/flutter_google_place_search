import 'package:flutter_google_place_search/src/data/models/matched_substring_model.dart';

class StructuredFormattingModel {
  String? mainText;
  List<MatchedSubstringModel>? mainTextMatchedSubstringModels;
  String? secondaryText;
  List<MatchedSubstringModel>? secondaryTextMatchedSubstringModels;

  StructuredFormattingModel({
    this.mainText,
    this.mainTextMatchedSubstringModels,
    this.secondaryText,
    this.secondaryTextMatchedSubstringModels,
  });

  factory StructuredFormattingModel.fromJson(Map<String, dynamic> json) {
    return StructuredFormattingModel(
      mainText: json['main_text'],
      mainTextMatchedSubstringModels:
          json['main_text_matched_substrings'] != null
              ? (json['main_text_matched_substrings'] as List)
                  .map((i) => MatchedSubstringModel.fromJson(i))
                  .toList()
              : null,
      secondaryText: json['secondary_text'],
      secondaryTextMatchedSubstringModels:
          json['secondary_text_matched_substrings'] != null
              ? (json['secondary_text_matched_substrings'] as List)
                  .map((i) => MatchedSubstringModel.fromJson(i))
                  .toList()
              : null,
    );
  }
}
