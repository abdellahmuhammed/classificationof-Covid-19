// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:flutter/cupertino.dart';

class DioApi{

 static Dio _dio;

  static init(){
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError:  true,
      ),
    );
  }


static Future<Response> PostData( {
  @ required String url ,
  @ required FormData data ,
  String token,


})async{
   return await _dio.post(
     url,
     data: data,
   );
  }
static Future<Response> getData(
    @required String url,
     Map<String , dynamic> query
    )async{
   return _dio.get(url,queryParameters: query);
  }




}