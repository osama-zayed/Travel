

import 'package:dio/dio.dart';

import '../model/login_model.dart';
import '../model/users_model.dart';

class LoginRepository {
  late Dio dio;

  String url = "http://localhost:8000/api/users";
  String urlLogin = "http://localhost:8000/api/login";

  LoginRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }
  Future<List<LoginModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dta = response.data as List;
        List<LoginModel> items = [];
        dta.forEach((element) {
          items.add(LoginModel.fromJson(element));
        });
        return items;
      }
      throw Exception("Response Error with code ${response.statusMessage}");
    }
    catch (ex) {
      rethrow;
    }
  }
  Future<UsersModel> add(LoginModel obj)async{
    var dt = {
      "email": obj.email,
      "password": obj.password,
    };
    try{
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.post(urlLogin, data: dt);
      if(response.statusCode == 200){
        var res = response.data;
        var usr = UsersModel.fromJson(res);
        return usr;
      }
      throw Exception("Response Error with code ${response.statusMessage}");
    }
    catch(ex){
      rethrow;
    }
  }
}