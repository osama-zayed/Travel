/// id : 1
/// name : "Aden airport"
/// city : "Aden"
/// country : "Yemen"
/// code : "ADE"
/// created_at : "2024-07-08T19:17:27.000000Z"
/// updated_at : "2024-07-09T07:13:22.000000Z"

class AirportModel {
  AirportModel({
      this.id, 
      this.name, 
      this.city, 
      this.country, 
      this.code, 
      this.createdAt, 
      this.updatedAt,});

  AirportModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? city;
  String? country;
  String? code;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['city'] = city;
    map['country'] = country;
    map['code'] = code;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}