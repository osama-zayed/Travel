/// id : 1
/// name : "salwan"
/// email : "salwan@gmail.com"
/// email_verified_at : null
/// phone_number : "777777777"
/// created_at : "2024-06-28T22:32:30.000000Z"
/// updated_at : "2024-06-28T22:32:30.000000Z"

class UsersModel {
  UsersModel({
      this.id, 
      this.name, 
      this.email,
      this.password,
      this.password_confirmation,
      this.emailVerifiedAt, 
      this.phoneNumber, 
      this.createdAt, 
      this.updatedAt,});

  UsersModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    password_confirmation = json['password_confirmation'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? email;
  String? password;
  String? password_confirmation;
  dynamic emailVerifiedAt;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['password_confirmation'] = password_confirmation;
    map['email_verified_at'] = emailVerifiedAt;
    map['phone_number'] = phoneNumber;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}