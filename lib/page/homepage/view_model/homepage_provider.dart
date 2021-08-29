///
/// homepage_provider
///
/// created by DZDcyj at 2021/8/29
///
import 'package:aliyun_oss_handler/base/view_model/base_page_view_provider.dart';

class HomePageProvider extends BasePageProvider {
  HomePageProvider(this.title);

  final String title;

  int _counter;

  int get counter => _counter ?? 0;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  void increment() => counter++;
}
