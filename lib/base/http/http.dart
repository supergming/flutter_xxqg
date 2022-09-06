import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:study_xxqg/base/http/resp/httpResponse.dart';
import 'package:study_xxqg/base/http/resp/nullResponse.dart';
import 'package:study_xxqg/base/http/tokenInterceptor.dart';
import 'package:study_xxqg/base/log/log.dart';
import 'package:study_xxqg/base/user/user.dart';
import 'package:study_xxqg/bean.jc.dart';


class Http {
  static Dio? _dio;
  static bool pushedLoginPage = false;

  static Dio getDio() {
    if (_dio == null) {
      initDioConfig();
    }
    return _dio!;
  }

  static void initDioConfig() {
    DioLogInterceptor.enablePrintLog = true;
    _dio = Dio(
      BaseOptions(
        baseUrl: UserInfo.getInfo().baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 5000,
        sendTimeout: 5000,
        contentType: "application/json",
      ),
    );
    _dio?.interceptors.add(DioLogInterceptor());
    _dio?.interceptors.add(TokenInterceptor());
  }


  static void setBaseUrl(String url){
    _dio?.options.baseUrl = url;
  }


  static void clear() {
    _dio = null;
  }

  static Future<HttpResponse<T?>> get<T>(String url,
      {Map<String, dynamic>? params}) async {
    var response = await _dio?.get(url, queryParameters: params);
    return encodeResponse<T>(response!);
  }

  static Future<HttpResponse<T?>> post<T>(String url,
      {Map<String, dynamic>? params, dynamic data}) async {
    var response = await _dio?.post(url, queryParameters: params, data: data,options: Options(followRedirects: false,validateStatus: (status){return status! < 500;}));
    return encodeResponse<T>(response!);
  }

  static Future<HttpResponse<T?>> put<T>(String url,
      {Map<String, dynamic>? params, dynamic data}) async {
    var response = await _dio?.put(url, queryParameters: params, data: data);
    return encodeResponse<T>(response!);
  }

  static Future<HttpResponse<T?>> delete<T>(String url,
      {Map<String, dynamic>? params, dynamic data}) async {
    var response = await _dio?.delete(url, queryParameters: params, data: data);
    return encodeResponse<T>(response!);
  }

  static HttpResponse<T?> encodeResponse<T>(Response<dynamic> response) {

    if ((response.data.runtimeType).toString() == "String"){
      response.data = jsonDecode(response.data);
    }
    if (response.data["code"] != 200) {
      Log.e("访问api出现错误");
      Log.e(response.data["error"]);
      return HttpResponse.n(response.data["code"], response.data["error"]);
    }
    if (T == String || T == int) {
      return HttpResponse(response.data["code"], response.data["message"], response.data["data"]);
    } else if (T == NullResponse) {
      return HttpResponse.n(response.data["code"], response.data["message"]);
    }  else {
      return HttpResponse(response.data["code"], response.data["message"],JsonConversion$Bean.fromJson<T>(response.data["data"]));
    }
  }
}
