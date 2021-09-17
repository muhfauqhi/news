import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class APIServices {
  String path = 'https://newsapi.org/v2/';

  getHeadline() async {
    var dio = Dio();
    Response response = await dio.get(path +
        'top-headlines?country=id&page=1&apiKey=5f00d331dfd24c32a3e34d70cae204b6');
    if (response.statusCode == 200) {
      return response.data['articles'];
    } else {
      return response.data;
    }
  }

  search() async {
    var dio = Dio();
    Response response = await dio.get(path +
        'everything?q=bitcoin&page=1&apiKey=5f00d331dfd24c32a3e34d70cae204b6');
    return response.data;
  }
}
