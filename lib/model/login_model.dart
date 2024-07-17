/// email : "selwan@gmail.com"
/// password : "$2y$12$OsqcEQIIsl4ts9bOw6g88O7mbAq0yrzk4LT1h1UWPGZ1bvpjeu6iW"

class LoginModel {
  LoginModel({
      this.email, 
      this.password,});

  LoginModel.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}