import 'package:flutter_google_place_search/src/data/models/address_component_model.dart';

class AddressComponent {
  String? longName;
  String? shortName;
  List<String>? types;

  AddressComponent({this.longName, this.shortName, this.types});

  factory AddressComponent.fromModel(AddressComponentModel model) {
    return AddressComponent(
      longName: model.longName,
      shortName: model.shortName,
      types: model.types,
    );
  }
}
