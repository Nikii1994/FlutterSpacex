class LandingLegs {
  int? number;
  Null? material;

  LandingLegs({this.number, this.material});

  LandingLegs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    material = json['material'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['material'] = this.material;
    return data;
  }
}