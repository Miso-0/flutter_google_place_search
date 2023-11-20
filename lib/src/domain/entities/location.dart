import 'package:flutter_google_place_search/src/data/models/location_model.dart';

class Location {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  factory Location.fromModel(LocationModel model) {
    return Location(
      lat: model.lat,
      lng: model.lng,
    );
  }

  LocationModel toModel() {
    return LocationModel(
      lat: lat,
      lng: lng,
    );
  }
}
