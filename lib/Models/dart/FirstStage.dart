import 'package:spacexrockets/Models/dart/ThrustSeaLevel.dart';

class FirstStage {
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  bool? reusable;
  int? engines;
  double? fuelAmountTons;
  int? burnTimeSec;

  FirstStage(
      {this.thrustSeaLevel,
        this.thrustVacuum,
        this.reusable,
        this.engines,
        this.fuelAmountTons,
        this.burnTimeSec});

  FirstStage.fromJson(Map<String, dynamic> json) {
    thrustSeaLevel = json['thrust_sea_level'] != null
        ? new ThrustSeaLevel.fromJson(json['thrust_sea_level'])
        : null;
    thrustVacuum = json['thrust_vacuum'] != null
        ? new ThrustSeaLevel.fromJson(json['thrust_vacuum'])
        : null;
    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thrustSeaLevel != null) {
      data['thrust_sea_level'] = this.thrustSeaLevel!.toJson();
    }
    if (this.thrustVacuum != null) {
      data['thrust_vacuum'] = this.thrustVacuum!.toJson();
    }
    data['reusable'] = this.reusable;
    data['engines'] = this.engines;
    data['fuel_amount_tons'] = this.fuelAmountTons;
    data['burn_time_sec'] = this.burnTimeSec;
    return data;
  }
}