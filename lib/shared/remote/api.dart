// ignore: file_names
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        }));
  }

  static Future<Response> getData(
      {required String url,  Map<String, dynamic> ? query , String lang = 'en' ,String?token}) {
    dio.options.headers = {
      'lang' : lang,
      'Authorization' : token,
    };
    return dio.get(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> postData(
      {required String url,  Map<String, dynamic> ?query , String lang = 'en' ,String?token}) {
    dio.options.headers = {
      'lang' : lang,
      'Authorization' : token,
    };
    return dio.post(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> deleteData(
      {required String url, required Map<String, dynamic> query , String lang = 'en' ,String?token}) {
    dio.options.headers = {
      'lang' : lang,
      'Authorization' : token,
    };
    return dio.delete(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> putData(
      {required String url, required Map<String, dynamic> query , String lang = 'en' ,String?token}) {
    dio.options.headers = {
      'lang' : lang,
      'Authorization' : token,
    };
    return dio.put(
      url,
      queryParameters: query,
    );
  }

}
