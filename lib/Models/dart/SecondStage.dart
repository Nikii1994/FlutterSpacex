import 'package:spacexrockets/Models/dart/ThrustSeaLevel.dart';



class SecondStage {
  ThrustSeaLevel? thrust;

  bool? reusable;
  int? engines;
  double? fuelAmountTons;
  int? burnTimeSec;

  SecondStage(
      {this.thrust,

        this.reusable,
        this.engines,
        this.fuelAmountTons,
        this.burnTimeSec});

  SecondStage.fromJson(Map<String, dynamic> json) {
    thrust = json['thrust'] != null
        ? new ThrustSeaLevel.fromJson(json['thrust'])
        : null;

    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thrust != null) {
      data['thrust'] = this.thrust!.toJson();
    }

    data['reusable'] = this.reusable;
    data['engines'] = this.engines;
    data['fuel_amount_tons'] = this.fuelAmountTons;
    data['burn_time_sec'] = this.burnTimeSec;
    return data;
  }
}
