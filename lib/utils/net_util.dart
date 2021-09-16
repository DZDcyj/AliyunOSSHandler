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
    Map<String, dynamic> params,
  }) {
    // var future = _get(constructUrl(api), params: params);
    // var stream = Stream.fromFuture(future).asBroadcastStream().transform<HttpResponseEntity<T>>(
    //   StreamTransformer.fromHandlers(
    //     handleData: (data, sink) {
    //       sink.add(data);
    //     },
    //   ),
    // );
    // return stream;
    return null;
  }

  Future<HttpResponseEntity<T>> _get<T extends ToJson>(
    String url, {
    Map<String, dynamic> params,
  }) async {
    var response = await dio.get(url, queryParameters: params);
    return response.data;
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
