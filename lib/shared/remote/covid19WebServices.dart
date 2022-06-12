import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
    @required String url,
  ) async {
    return await _dio.get(url);
  }
}
