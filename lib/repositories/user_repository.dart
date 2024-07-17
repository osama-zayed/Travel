import 'package:dio/dio.dart';

import '../model/users_model.dart';


class UserRepository {
  late Dio dio;

  String url = "http://localhost:8000/api/users";
  String urlRegister = "http://localhost:8000/api/register";

  UserRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }
  Future<List<UsersModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dta = response.data as List;
        List<UsersModel> items = [];
        dta.forEach((element) {
          items.add(UsersModel.fromJson(element));
        });
        return items;
      }
      throw Exception("Response Error with code ${response.statusMessage}");
    }
    catch (ex) {
      rethrow;
    }
  }
  Future<bool> add(UsersModel obj)async{
    var dt = {
      "name": obj.name,
      "email": obj.email,
      "phone_number": obj.phoneNumber,
      "password": obj.password,
      "password_confirmation": obj.password_confirmation,
    };
    try{
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.post(urlRegister, data: dt);
      if(response.statusCode == 200){
        var res = response.data as bool;
        return res;
      }

      throw Exception("Response Error with code ${response.statusMessage}");
    }
    catch(ex){
      rethrow;
    }
  }
}