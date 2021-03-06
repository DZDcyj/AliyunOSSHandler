///
/// http_response_entity
///
/// created by DZDcyj at 2021/9/16
///
import 'bean.dart';

abstract class ToJson {
  Map<String, dynamic> toJson();
}

/// 网络返回信息实体类
class HttpResponseEntity<T extends ToJson> implements ToJson {
  int code; // 状态码
  String msg; // 信息
  Map<String, dynamic> rawData; // 原始数据
  T data; // 转换后数据

  HttpResponseEntity({
    this.code,
    this.msg,
    this.rawData,
    this.data,
  });

  HttpResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? -1;
    msg = json['msg'] ?? '';
    rawData = json['data'] ?? {};
    data = EntityFactory.generate<T>(json['data']);
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};
    result['code'] = code;
    result['msg'] = msg;
    result['raw_data'] = rawData;
    result['data'] = data.toJson();
    return result;
  }
}
