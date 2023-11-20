import 'package:flutter_google_place_search/src/data/models/term_model.dart';

class Term {
  int? offset;
  String? value;

  Term({this.offset, this.value});

  factory Term.fromModel(TermModel model) {
    return Term(
      offset: model.offset,
      value: model.value,
    );
  }
}
