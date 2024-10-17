import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  static Dio dio = Dio();

  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: '',
          receiveDataWhenStatusError: true,
          receiveTimeout: const Duration(minutes: 3),
          connectTimeout: const Duration(minutes: 3),
          sendTimeout: const Duration(minutes: 3),
          headers:  {
            "Accept": "application/json",
            "Content-Type": "application/json",

          }),
    );
    addDioInterceptor();
  }

  static void addDioInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

//////////////////////////////////////////////////////////
  static Future<Response> getData({
    required String urll,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
  }) async {
    return await dio.get(urll, queryParameters: queries, data: data);
  }
  ////////////////////////////////////////////////////////

  static Future<Response> postData({
    required String urll,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queries,
  }) async {
    print('Request URL: ${dio.options.baseUrl}$urll');

    return await dio.post(urll, data: data);
  }

  static Future<Response> patchData({
    required String urll,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queries,
  }) async {
    return await dio.patch(
      urll,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String urll,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queries,
  }) async {
    return await dio.delete(urll, data: data);
  }
}
