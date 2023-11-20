import 'package:flutter_google_place_search/src/data/models/location_model.dart';

class ViewportModel {
  LocationModel? northeast;
  LocationModel? southwest;

  ViewportModel({this.northeast, this.southwest});

  factory ViewportModel.fromJson(Map<String, dynamic> json) {
    return ViewportModel(
      northeast: json['northeast'] != null
          ? LocationModel.fromJson(json['northeast'])
          : null,
      southwest: json['southwest'] != null
          ? LocationModel.fromJson(json['southwest'])
          : null,
    );
  }
}
