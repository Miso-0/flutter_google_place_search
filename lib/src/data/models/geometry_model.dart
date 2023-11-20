import 'package:flutter_google_place_search/src/data/models/viewport_model.dart';
import 'location_model.dart';

class GeometryModel {
  LocationModel? location;
  String? locationType;
  ViewportModel? viewport;

  GeometryModel({this.location, this.locationType, this.viewport});

  factory GeometryModel.fromJson(Map<String, dynamic> json) {
    return GeometryModel(
      location:
          json['location'] != null ? LocationModel.fromJson(json['location']) : null,
      locationType: json['location_type'],
      viewport:
          json['viewport'] != null ? ViewportModel.fromJson(json['viewport']) : null,
    );
  }
}
