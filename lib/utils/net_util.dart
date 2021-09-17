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
import 'package:flutter/foundation.dart';

class NetUtil {
  NetUtil();

  static final BaseOptions baseOptions = BaseOptions(
    connectTimeout: maxTimeout,
    receiveTimeout: maxTimeout,
    contentType: contentType,
    responseType: ResponseType.json,
  );

  Dio dio = Dio(baseOptions)..transformer = FlutterTransformer();

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

  Map<String, dynamic> parseResponse(Response response) {
    Map<String, dynamic> result = {};
    Map<String, dynamic> data = json.decode(response.data);
    result['code'] = data['code'] ?? -1;
    result['msg'] = data['msg'] ?? '';
    result['data'] = data['data'];
    return result;
  }
}

String constructUrl(String api) {
  return 'https://$api';
}

class FlutterTransformer extends DefaultTransformer {
  FlutterTransformer() : super(jsonDecodeCallback: _parseJson);
}

dynamic _parseAndDecode(String response) {
  return jsonDecode(response);
}

_parseJson(String text) {
  return compute(_parseAndDecode, text);
}
