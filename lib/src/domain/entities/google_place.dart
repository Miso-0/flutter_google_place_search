import 'package:flutter_google_place_search/src/domain/entities/google_place_details.dart';

class GooglePlace {
  final String address;
  final String placeId;
  final double lat;
  final double lng;
  final GooglePlaceDetails details;

  GooglePlace({
    required this.address,
    required this.placeId,
    required this.lat,
    required this.lng,
    required this.details,
  });

  @override
  String toString() {
    return 'GooglePlace(address: $address, placeId: $placeId, lat: $lat, lng: $lng, details: $details)';
  }
}
