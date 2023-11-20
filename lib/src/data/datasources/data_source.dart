import 'package:flutter_google_place_search/src/data/datasources/idata_source.dart';
import 'package:flutter_google_place_search/src/data/models/google_place_details_model.dart';
import 'package:flutter_google_place_search/src/data/models/location_model.dart';
import 'package:flutter_google_place_search/src/data/models/prediction_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_google_place_search/src/domain/entities/place_type.dart';

class DataSource implements IDataSource {
  final Dio _dio;

  DataSource({required Dio dio}) : _dio = dio;

  @override
  Future<GooglePlaceDetailsModel?> getPlaceDetail({
    required String placeId,
    required String key,
  }) async {
    try {
      const url = "https://maps.googleapis.com/maps/api/geocode/json";

      final params = {"place_id": placeId, "key": key};

      final response = await _dio.get(url, queryParameters: params);

      if (response.statusCode == 200) {
        final predictions = response.data["results"] as List;

        return predictions
            .map((e) => GooglePlaceDetailsModel.fromJson(e))
            .toList()
            .firstOrNull;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PredictionModel>> searchPredictions({
    required String input,
    required String key,
    List<PlaceType> placeTypes = const [PlaceType.establishment],
    String? region,
    LocationModel? origin,
  }) async {
    try {
      const url =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json";

      final params = {"input": input, "key": key};

      if (region != null) {
        params["region"] = region;
      }

      if (origin != null) {
        params["origin"] = "${origin.lat},${origin.lng}";
      }

      final types = placeTypes.map((e) => e.name).join("|");

      params["types"] = types;

      final response = await _dio.get(url, queryParameters: params);

      if (response.statusCode == 200) {
        final predictions = response.data["predictions"] as List;

        return predictions.map((e) => PredictionModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
