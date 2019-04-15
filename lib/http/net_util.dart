import 'dart:io';
import 'package:robin_app/common/constant.dart';
import 'package:dio/dio.dart';
import 'dart:async';

var dio = new Dio();

class NetUtils {
  static Future get(String url, {Map<String, dynamic> params}) async {
    dio.options.headers = {"auth": Constant.AUTH_KEY};
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    print("url =="+url);
    var response =
        await dio.get(url, queryParameters: params);
    return response;
  }

  /// Post请求
  static Future post(String url, {Map<String, dynamic> params}) async{
    var response = await dio.post(url, data: params);
    return response;
  }
}
