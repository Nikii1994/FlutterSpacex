class Mass {
  int? kg;
  int? lb;

  Mass({this.kg, this.lb});

  Mass.fromJson(Map<String, dynamic> json) {
    kg = json['kg'];
    lb = json['lb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kg'] = this.kg;
    data['lb'] = this.lb;
    return data;
  }
}
