import 'package:bilqis/model/airport_model.dart';
import 'package:dio/dio.dart';


class AirportRepository {
  late Dio dio;

  String url = "http://localhost:8000/api/airports";

  AirportRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<List<AirportModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dta = response.data as List;
        List<AirportModel> items = [];
        dta.forEach((element) {
          items.add(AirportModel.fromJson(element));
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
