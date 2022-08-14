import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:study_xxqg/base/log/log.dart';
import 'package:study_xxqg/base/user/user.dart';

class TokenInterceptor implements Interceptor{
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Fluttertoast.showToast(msg: err.message,textColor: Colors.red,fontSize: 10);
    handler.next(err);
  }


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["User-Agent"] = "study_xxqg-app";
    options.headers["Content-Type"] = "application/json;charset=UTF-8";
    options.headers["xxqg_token"] =  UserInfo.getInfo().token;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

}