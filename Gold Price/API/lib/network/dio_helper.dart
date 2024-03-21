import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
class DioHelper{
  static Dio? dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl:'https://www.goldapi.io/api/' ,
        receiveDataWhenStatusError: true,
      )
    );
  }
  static Future<Response> getData(String url)  {
    dio!.options.headers={
      'x-access-token':'goldapi-2epa1rlj5ibazi-io'
    };

    return dio!.get(url);
  }


}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}


// https://www.goldapi.io/api/XAU/USD/
// goldapi-2epa1rlj5ibazi-io