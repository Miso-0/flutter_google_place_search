import 'package:flutter_google_place_search/src/data/models/matched_substring_model.dart';

class MatchedSubstring {
  int? length;
  int? offset;

  MatchedSubstring({this.length, this.offset});

  factory MatchedSubstring.fromModel(MatchedSubstringModel model) {
    return MatchedSubstring(
      length: model.length,
      offset: model.offset,
    );
  }
}
