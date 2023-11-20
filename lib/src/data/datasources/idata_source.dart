import 'package:flutter_google_place_search/src/data/models/google_place_details_model.dart';
import 'package:flutter_google_place_search/src/data/models/location_model.dart';
import 'package:flutter_google_place_search/src/data/models/prediction_model.dart';
import 'package:flutter_google_place_search/src/domain/entities/place_type.dart';

abstract class IDataSource {
  /// Returns a list of predictions based on the @param input text.
  ///
  /// Key is the API key for the Google Maps API.
  ///
  /// Region is the region code, specified as a ccTLD (country code top-level domain) two-character value.
  ///
  /// Origin is the point from which you wish to search for places.
  Future<List<PredictionModel>> searchPredictions({
    required String input,
    required String key,
    List<PlaceType> placeTypes = const [PlaceType.establishment],
    String? region,
    LocationModel? origin,
  });

  /// Gets the details of a place based on the placeId.
  Future<GooglePlaceDetailsModel?> getPlaceDetail({
    required String placeId,
    required String key,
  });
}
