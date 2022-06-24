import 'package:dio/dio.dart';

class CovidWebService {
  static Dio _dio;

  static initCovid() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://disease.sh/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
     dynamic url,
  ) async {
    return await _dio.get(url);
  }
}
