import 'package:dio/dio.dart';

class DioHelper {
  static  late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.aladhan.com/v1/timingsByCity?city=Riyad&country=Saudia%20Arabia&method=8',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,

  }) async {

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang='er',
    String? token,
  }) async {
    dio.options.headers={
      'Content-Type': 'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return await dio.post(url, queryParameters: query, data: data);
  }
}