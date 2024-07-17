/// id : 2
/// name : "FGY3"
/// model : "VURT12"
/// airline : "BILGES"
/// first_class : 10
/// business_class : 20
/// economy_class : 30
/// status : "active"
/// created_at : "2024-07-09T11:31:24.000000Z"
/// updated_at : "2024-07-09T11:31:24.000000Z"
/// type : "out_of_service"

class PlaneModel {
  PlaneModel({
      this.id, 
      this.name, 
      this.model, 
      this.airline, 
      this.firstClass, 
      this.businessClass, 
      this.economyClass, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.type,});

  PlaneModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    model = json['model'];
    airline = json['airline'];
    firstClass = json['first_class'];
    businessClass = json['business_class'];
    economyClass = json['economy_class'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
  }
  int? id;
  String? name;
  String? model;
  String? airline;
  int? firstClass;
  int? businessClass;
  int? economyClass;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['model'] = model;
    map['airline'] = airline;
    map['first_class'] = firstClass;
    map['business_class'] = businessClass;
    map['economy_class'] = economyClass;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['type'] = type;
    return map;
  }

}