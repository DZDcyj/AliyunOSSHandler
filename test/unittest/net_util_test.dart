///
/// net_util_test
///
/// created by DZDcyj at 2021/9/16
///
import 'package:aliyun_oss_handler/utils/net_util.dart';
import 'package:dartin/dartin.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/app_module.dart';

void main() {
  init();

  NetUtil netUtil = inject();

  // void mockGetData() {
  //   when(netUtil.get<MapEntity>(any)).thenAnswer(
  //     (realInvocation) => Stream.fromFuture(
  //       Future.value(
  //         json.decode(successResponse),
  //       ),
  //     ),
  //   );
  // }

  test('get', () {
    // mockGetData();

    // netUtil.get('api').listen((response) {
    //   expect(response.code, responseOK);
    //   expect(response.msg, 'success');
    //   expect(response.rawData is Map, true);
    //   expect(response.data is MapEntity, true);
    // });

    expect(netUtil.get('api'), null);
  });

  test('constructUrl', () {
    expect(constructUrl('api'), 'https://api');
  });
}
