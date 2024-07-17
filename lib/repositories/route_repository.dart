
import 'package:bilqis/model/route_model.dart';
import 'package:dio/dio.dart';


class RouteRepository {
  late Dio dio;

  String url = "http://localhost:8000/api/routes";

  RouteRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<List<RouteModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dta = response.data as List;
        List<RouteModel> items = [];
        dta.forEach((element) {
          items.add(RouteModel.fromJson(element));
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
