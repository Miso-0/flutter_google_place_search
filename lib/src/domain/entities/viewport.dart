import 'package:flutter_google_place_search/src/data/models/viewport_model.dart';
import 'package:flutter_google_place_search/src/domain/entities/location.dart';

class Viewport {
  Location? northeast;
  Location? southwest;

  Viewport({this.northeast, this.southwest});

  factory Viewport.fromModel(ViewportModel model) {
    return Viewport(
      northeast:
          model.northeast != null ? Location.fromModel(model.northeast!) : null,
      southwest:
          model.southwest != null ? Location.fromModel(model.southwest!) : null,
    );
  }
}
