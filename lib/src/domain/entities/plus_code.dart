import 'package:flutter_google_place_search/src/data/models/plus_code_model.dart';

class PlusCode {
  String? compoundCode;
  String? globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  factory PlusCode.fromModel(PlusCodeModel model) {
    return PlusCode(
      compoundCode: model.compoundCode,
      globalCode: model.globalCode,
    );
  }
}
