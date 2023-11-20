import 'package:dio/dio.dart';
import 'package:flutter_google_place_search/src/data/datasources/data_source.dart';
import 'package:flutter_google_place_search/src/data/datasources/idata_source.dart';
import 'package:flutter_google_place_search/src/domain/entities/google_place.dart';
import 'package:flutter_google_place_search/src/domain/entities/google_place_details.dart';
import 'package:flutter_google_place_search/src/domain/entities/location.dart';
import 'package:flutter_google_place_search/src/domain/entities/place_type.dart';

class FlutterGooglePlace {
  final String _key;
  final String? _region;
  final Location? _origin;
  final List<PlaceType> _placeTypes;
  final IDataSource _dataSource;

  FlutterGooglePlace({
    required String key,
    String? region,
    Location? origin,
    List<PlaceType> placeTypes = const [PlaceType.establishment],
  })  : _key = key,
        _region = region,
        _origin = origin,
        _placeTypes = placeTypes,
        _dataSource = DataSource(dio: Dio());

  Future<List<GooglePlace>> getPredictions(String input) async {
    try {
      //
      final places = <GooglePlace>[];

      // Get predictions
      final predictions = await _dataSource.searchPredictions(
        input: input,
        key: _key,
        placeTypes: _placeTypes,
        region: _region,
        origin: _origin?.toModel(),
      );

      // Get details
      for (final prediction in predictions) {
        final detaills = await _getDetails(prediction.placeId);
        if (detaills != null) {
          if (detaills.formattedAddress != null &&
              detaills.geometry?.location?.lat != null &&
              detaills.geometry?.location?.lng != null) {
            places.add(
              GooglePlace(
                address: detaills.formattedAddress!,
                placeId: prediction.placeId!,
                lat: detaills.geometry!.location!.lat!,
                lng: detaills.geometry!.location!.lng!,
                details: detaills,
              ),
            );
          }
        }
      }
      return places;
    } catch (e) {
      return [];
    }
  }

  Future<GooglePlaceDetails?> _getDetails(String? id) async {
    try {
      if (id == null) return null;
      final details = await _dataSource.getPlaceDetail(
        placeId: id,
        key: _key,
      );
      if (details == null) return null;
      return GooglePlaceDetails.fromModel(details);
    } catch (e) {
      return null;
    }
  }
}
