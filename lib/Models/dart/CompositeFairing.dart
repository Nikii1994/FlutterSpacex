import 'package:spacexrockets/Models/dart/Height.dart';

import 'Diameter.dart';

class CompositeFairing {
  Height? height;
  Diameter? diameter;

  CompositeFairing({this.height, this.diameter});

  CompositeFairing.fromJson(Map<String, dynamic> json) {
    height =
    json['height'] != null ?  Height.fromJson(json['height']) : null;
    diameter = json['diameter'] != null
        ? new Diameter.fromJson(json['diameter'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.height != null) {
      data['height'] = this.height!.toJson();
    }
    if (this.diameter != null) {
      data['diameter'] = this.diameter!.toJson();
    }
    return data;
  }
}