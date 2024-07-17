/// id : 9
/// flight_number : "QL106"
/// airline : "BILQIS"
/// plane_id : 2
/// route_id : 1
/// day : "Monday"
/// date : "2024-07-26"
/// departure_time : "18:37:00"
/// arrival_time : "19:33:00"
/// status : "scheduled"
/// created_at : "2024-07-09T11:34:05.000000Z"
/// updated_at : "2024-07-09T11:34:05.000000Z"

class MyTripsModel {
  MyTripsModel({
      this.id, 
      this.flightNumber, 
      this.airline, 
      this.planeId, 
      this.routeId, 
      this.day, 
      this.date, 
      this.departureTime, 
      this.arrivalTime, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  MyTripsModel.fromJson(dynamic json) {
    id = json['id'];
    flightNumber = json['flight_number'];
    airline = json['airline'];
    planeId = json['plane_id'];
    routeId = json['route_id'];
    day = json['day'];
    date = json['date'];
    departureTime = json['departure_time'];
    arrivalTime = json['arrival_time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? flightNumber;
  String? airline;
  int? planeId;
  int? routeId;
  String? day;
  String? date;
  String? departureTime;
  String? arrivalTime;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['flight_number'] = flightNumber;
    map['airline'] = airline;
    map['plane_id'] = planeId;
    map['route_id'] = routeId;
    map['day'] = day;
    map['date'] = date;
    map['departure_time'] = departureTime;
    map['arrival_time'] = arrivalTime;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}