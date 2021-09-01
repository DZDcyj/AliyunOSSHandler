///
/// base_page_view_provider
///
/// created by DZDcyj at 2021/8/29
///
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

abstract class BasePageProvider extends ChangeNotifier {
  bool isDisposed = false;

  CompositeSubscription _compositeSubscription = CompositeSubscription();

  @override
  void dispose() {
    super.dispose();
    if (isDisposed) {
      return;
    }
    isDisposed = true;
    _compositeSubscription.dispose();
  }
}
