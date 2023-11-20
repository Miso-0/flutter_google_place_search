class AddressComponentModel {
  String? longName;
  String? shortName;
  List<String>? types;

  AddressComponentModel({this.longName, this.shortName, this.types});

  factory AddressComponentModel.fromJson(Map<String, dynamic> json) {
    return AddressComponentModel(
      longName: json['long_name'],
      shortName: json['short_name'],
      types: json['types']?.cast<String>(),
    );
  }
}
