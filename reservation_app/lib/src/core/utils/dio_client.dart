import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservation_app/src/constants/app_strings.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';

class DioClient extends ChangeNotifier {
  Dio init() {
    Dio dio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },

      ),
        // BaseOptions.headers["Authorization"] = "Bearer " +SharedPrefs.getToken();
    );
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = AppStrings.baseUrl;
    return dio;
  }
}

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Do something before request is sent
    // options.headers["Authorization"] = "token ${SharedPrefs.getToken()}";
    String token = await SharedPrefs.getToken();
    options.headers.addAll({'authorization': 'Bearer $token'});
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // Do something with response data
    print("Here is the status code: ${response.statusCode}");
    print("Here is the response: $response");

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Do something with response error
    handler.next(err);
  }
}
