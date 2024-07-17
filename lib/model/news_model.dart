/// id : 1
/// address : "خبر1"
/// content : "نتلاب"
/// image : "admin/Qsdf5xMQ0KT6mqBhzzS9W1Oy7jEqWK2DLdNxMXSR.png"
/// user_id : 3
/// created_at : "2024-06-24T22:36:07.000000Z"
/// updated_at : "2024-06-24T22:36:07.000000Z"

class NewsModel {
  NewsModel({
      this.id, 
      this.address, 
      this.content, 
      this.image, 
      this.userId, 
      this.createdAt, 
      this.updatedAt,});

  NewsModel.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    content = json['content'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? address;
  String? content;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['content'] = content;
    map['image'] = image;
    map['user_id'] = userId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}