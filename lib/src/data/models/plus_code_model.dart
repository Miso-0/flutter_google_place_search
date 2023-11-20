class PlusCodeModel {
  String? compoundCode;
  String? globalCode;

  PlusCodeModel({this.compoundCode, this.globalCode});

  factory PlusCodeModel.fromJson(Map<String, dynamic> json) {
    return PlusCodeModel(
      compoundCode: json['compound_code'],
      globalCode: json['global_code'],
    );
  }
}
