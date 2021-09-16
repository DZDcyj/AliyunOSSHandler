///
/// http_response_entity
///
/// created by DZDcyj at 2021/9/16
///
abstract class ToJson {
  Map<String, dynamic> toJson();
}

/// Map 实体类
class MapEntity implements ToJson {
  Map<String, dynamic> content;

  MapEntity.fromJson(Map<String, dynamic> json) {
    content = json;
  }

  Map<String, dynamic> toJson() => content;
}

/// 网络返回信息实体类
class HttpResponseEntity implements ToJson {
  int code; // 状态码
  String msg; // 信息
  Map<String, dynamic> data; // 数据

  HttpResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  HttpResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? -1;
    msg = json['msg'] ?? '';
    data = json['data'] ?? {};
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};
    result['code'] = code;
    result['msg'] = msg;
    result['data'] = data;
    return result;
  }
}
