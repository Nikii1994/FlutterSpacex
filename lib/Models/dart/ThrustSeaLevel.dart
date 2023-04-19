class ThrustSeaLevel {
  int? kN;
  int? lbf;

  ThrustSeaLevel({this.kN, this.lbf});

  ThrustSeaLevel.fromJson(Map<String, dynamic> json) {
    kN = json['kN'];
    lbf = json['lbf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kN'] = this.kN;
    data['lbf'] = this.lbf;
    return data;
  }
}