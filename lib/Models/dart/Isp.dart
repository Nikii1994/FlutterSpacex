class Isp {
  int? seaLevel;
  int? vacuum;

  Isp({this.seaLevel, this.vacuum});

  Isp.fromJson(Map<String, dynamic> json) {
    seaLevel = json['sea_level'];
    vacuum = json['vacuum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sea_level'] = this.seaLevel;
    data['vacuum'] = this.vacuum;
    return data;
  }
}