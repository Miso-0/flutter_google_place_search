import 'package:flutter_google_place_search/src/data/models/structured_formatting_model.dart';
import 'package:flutter_google_place_search/src/domain/entities/matched_substring.dart';

class StructuredFormatting {
  String? mainText;
  List<MatchedSubstring>? mainTextMatchedSubstrings;
  String? secondaryText;
  List<MatchedSubstring>? secondaryTextMatchedSubstrings;

  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
    this.secondaryTextMatchedSubstrings,
  });

  factory StructuredFormatting.fromModel(StructuredFormattingModel model) {
    return StructuredFormatting(
      mainText: model.mainText,
      mainTextMatchedSubstrings: model.mainTextMatchedSubstringModels
          ?.map((e) => MatchedSubstring.fromModel(e))
          .toList(),
      secondaryText: model.secondaryText,
      secondaryTextMatchedSubstrings: model.secondaryTextMatchedSubstringModels
          ?.map((e) => MatchedSubstring.fromModel(e))
          .toList(),
    );
  }
}
