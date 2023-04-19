class Diameter {
  dynamic meters;
  dynamic feet;

  Diameter({this.meters, this.feet});

  Diameter.fromJson(Map<String, dynamic> json) {
    meters = json['meters'];
    feet = json['feet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meters'] = this.meters;
    data['feet'] = this.feet;
    return data;
  }
}