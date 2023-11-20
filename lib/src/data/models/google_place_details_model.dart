import 'address_component_model.dart';
import 'geometry_model.dart';
import 'plus_code_model.dart';


class GooglePlaceDetailsModel {
  List<AddressComponentModel>? addressComponentModels;
  String? formattedAddress;
  GeometryModel? geometryModel;
  String? placeId;
  PlusCodeModel? plusCode;
  List<String>? types;

  GooglePlaceDetailsModel({
    this.addressComponentModels,
    this.formattedAddress,
    this.geometryModel,
    this.placeId,
    this.plusCode,
    this.types,
  });

  factory GooglePlaceDetailsModel.fromJson(Map<String, dynamic> json) {
    return GooglePlaceDetailsModel(
      addressComponentModels: json['address_components'] != null
          ? (json['address_components'] as List)
              .map((i) => AddressComponentModel.fromJson(i))
              .toList()
          : null,
      formattedAddress: json['formatted_address'],
      geometryModel: json['geometry'] != null
          ? GeometryModel.fromJson(json['geometry'])
          : null,
      placeId: json['place_id'],
      plusCode: json['plus_code'] != null
          ? PlusCodeModel.fromJson(json['plus_code'])
          : null,
      types: json['types']?.cast<String>(),
    );
  }
}
