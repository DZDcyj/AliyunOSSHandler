///
/// app_module
///
/// created by DZDcyj at 2021/8/29
///
import 'package:aliyun_oss_handler/page/homepage/view_model/homepage_provider.dart';
import 'package:aliyun_oss_handler/page/init_page/view_model/init_page_provider.dart';
import 'package:aliyun_oss_handler/utils/net_util.dart';
import 'package:dartin/dartin.dart';
import 'package:mockito/mockito.dart';

final viewModelModule = Module([
  factory<HomePageProvider>(
    ({params}) => HomePageProvider(
      params.get(0),
    ),
  ),
  factory<InitPageProvider>(
    ({params}) => InitPageProvider(),
  ),
]);

class NetUtilMock extends Mock implements NetUtil {}

final utilModule = Module([
  single<NetUtil>(({params}) => NetUtilMock()),
]);

final appModule = [viewModelModule, utilModule];

void init() {
  startDartIn(appModule);
}
