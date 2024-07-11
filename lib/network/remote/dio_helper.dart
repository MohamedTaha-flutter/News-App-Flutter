import 'package:dio/dio.dart';

class DioHelper {
  static  Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required dynamic query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}

//https://newsapi.org/
// v2/top-headlines?
// country=eg&category=business&apiKey=1d60a630e76f4d359bf11e1e43d6450d
