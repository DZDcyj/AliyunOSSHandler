import 'package:aliyun_oss_handler/page/homepage/view_model/homepage_provider.dart';
import 'package:flutter_test/flutter_test.dart';

///
/// homepage_provider_test
///
/// created by DZDcyj at 2021/8/29
///
import '../base/app_module.dart';

void main() {
  init();

  test('increment', () {
    HomePageProvider provider = HomePageProvider('title');
    expect(provider.counter, 0);
    provider.increment();
    expect(provider.counter, 1);
  });
}
