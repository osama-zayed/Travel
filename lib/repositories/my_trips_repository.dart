
import 'package:dio/dio.dart';

import '../model/my_trips_model.dart';

class MyTripsRepository {
  late Dio dio;

  String url = "http://localhost:8000/api/flights";

  MyTripsRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<List<MyTripsModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dta = response.data as List;
        List<MyTripsModel> items = [];
        dta.forEach((element) {
          items.add(MyTripsModel.fromJson(element));
        });
        return items;
      }
      throw Exception("Response Error with code ${response.statusMessage}");
    }
    catch (ex) {
      rethrow;
    }
  }
}
