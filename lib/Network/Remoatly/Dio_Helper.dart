import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_zone/Shared/Constants/Constants.dart';

class DioHelper {
  static Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
        headers: {
        'lang': 'en',
         'Content-Type':'application/json',

      }),
    );
  }

  static Future<Response> postData(
      {
        @required String? url,
        @required Map<String,dynamic>? data,
        Map<String,dynamic>? query,
        String? lang = 'en',
        String? token,

      }
      ) async{
    dio!.options.headers={
      'lang': lang,
      'Content-Type':'application/json',
      'Authorization':token,


    };
    return dio!.post(
      url!,
      data: data,
      queryParameters: query );
  }

}