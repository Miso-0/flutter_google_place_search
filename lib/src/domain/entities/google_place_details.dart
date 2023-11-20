import 'package:flutter_google_place_search/src/data/models/google_place_details_model.dart';
import 'address_component.dart';
import 'geometry.dart';
import 'plus_code.dart';

class GooglePlaceDetails {
  List<AddressComponent>? addressComponents;
  String? formattedAddress;
  Geometry? geometry;
  String? placeId;
  PlusCode? plusCode;
  List<String>? types;

  GooglePlaceDetails({
    this.addressComponents,
    this.formattedAddress,
    this.geometry,
    this.placeId,
    this.plusCode,
    this.types,
  });

  factory GooglePlaceDetails.fromModel(GooglePlaceDetailsModel model) {
    return GooglePlaceDetails(
      addressComponents: model.addressComponentModels
          ?.map((e) => AddressComponent.fromModel(e))
          .toList(),
      formattedAddress: model.formattedAddress,
      geometry: model.geometryModel != null
          ? Geometry.fromModel(model.geometryModel!)
          : null,
      placeId: model.placeId,
      plusCode:
          model.plusCode != null ? PlusCode.fromModel(model.plusCode!) : null,
      types: model.types,
    );
  }
}
