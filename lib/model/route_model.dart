/// id : 1
/// departure_airport_id : 1
/// arrival_airport_id : 1
/// distance : 30
/// duration : "13:27:00"
/// created_at : "2024-07-08T19:24:06.000000Z"
/// updated_at : "2024-07-08T19:24:06.000000Z"

class RouteModel {
  RouteModel({
      this.id, 
      this.departureAirportId, 
      this.arrivalAirportId, 
      this.distance, 
      this.duration, 
      this.createdAt, 
      this.updatedAt,});

  RouteModel.fromJson(dynamic json) {
    id = json['id'];
    departureAirportId = json['departure_airport_id'];
    arrivalAirportId = json['arrival_airport_id'];
    distance = json['distance'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? departureAirportId;
  int? arrivalAirportId;
  int? distance;
  String? duration;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['departure_airport_id'] = departureAirportId;
    map['arrival_airport_id'] = arrivalAirportId;
    map['distance'] = distance;
    map['duration'] = duration;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}