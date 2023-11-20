class LocationModel {
  double? lat;
  double? lng;

  LocationModel({this.lat, this.lng});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
