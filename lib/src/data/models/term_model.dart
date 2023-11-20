class TermModel {
  int? offset;
  String? value;

  TermModel({this.offset, this.value});

  factory TermModel.fromJson(Map<String, dynamic> json) {
    return TermModel(
      offset: json['offset'],
      value: json['value'],
    );
  }
}
