import 'package:flutter_google_place_search/src/data/models/geometry_model.dart';
import 'location.dart';
import 'viewport.dart';

class Geometry {
  Location? location;
  String? locationType;
  Viewport? viewport;

  Geometry({this.location, this.locationType, this.viewport});

  factory Geometry.fromModel(GeometryModel model) {
    return Geometry(
      location:
          model.location != null ? Location.fromModel(model.location!) : null,
      locationType: model.locationType,
      viewport:
          model.viewport != null ? Viewport.fromModel(model.viewport!) : null,
    );
  }
}
