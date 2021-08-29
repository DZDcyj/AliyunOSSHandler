///
/// app_module
///
/// created by DZDcyj at 2021/8/29
///
import 'package:aliyun_oss_handler/page/homepage/view_model/homepage_provider.dart';
import 'package:dartin/dartin.dart';

final viewModelModule = Module([
  factory<HomePageProvider>(
    ({params}) => HomePageProvider(
      params.get(0),
    ),
  ),
]);

final appModule = [viewModelModule];
