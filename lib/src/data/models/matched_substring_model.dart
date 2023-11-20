class MatchedSubstringModel {
  int? length;
  int? offset;

  MatchedSubstringModel({this.length, this.offset});

  factory MatchedSubstringModel.fromJson(Map<String, dynamic> json) {
    return MatchedSubstringModel(
      length: json['length'],
      offset: json['offset'],
    );
  }
}
