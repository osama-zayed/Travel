import 'package:bilqis/model/news_model.dart';
import 'package:dio/dio.dart';


class NewsRepository {
  late Dio dio;

  String url = "http://localhost:8000/api/news";

  NewsRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<List<NewsModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dta = response.data as List;
        List<NewsModel> items = [];
        dta.forEach((element) {
          items.add(NewsModel.fromJson(element));
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
