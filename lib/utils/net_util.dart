///
/// net_util
///
/// created by DZDcyj at 2021/9/16
///
import 'dart:async';
import 'dart:convert';

import 'package:aliyun_oss_handler/bean/bean.dart';
import 'package:aliyun_oss_handler/constants/constants.dart';
import 'package:dio/dio.dart';

class NetUtil {
  NetUtil();

  static final BaseOptions baseOptions = BaseOptions(
    connectTimeout: maxTimeout,
    receiveTimeout: maxTimeout,
    contentType: contentType,
    responseType: ResponseType.json,
  );

  Dio dio = Dio(baseOptions);

  Stream<HttpResponseEntity<T>> get<T extends ToJson>(
    String api, {
    Map<String, dynamic> queryParameters,
  }) {
    return _get<T>(constructUrl(api), queryParameters: queryParameters).asStream().asBroadcastStream();
  }

  Future<HttpResponseEntity<T>> _get<T extends ToJson>(
    String url, {
    Map<String, dynamic> queryParameters,
  }) async {
    var response = await dio.get(url, queryParameters: queryParameters);
    return HttpResponseEntity<T>.fromJson(json.decode(response.data));
  }
}

String constructUrl(String api) {
  return 'https://$api';
}
