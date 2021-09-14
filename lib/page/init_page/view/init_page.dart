///
/// init_page
///
/// created by DZDcyj at 2021/9/14
///
import 'package:aliyun_oss_handler/base/view/base_page_view.dart';
import 'package:aliyun_oss_handler/page/init_page/view_model/init_page_provider.dart';
import 'package:aliyun_oss_handler/router/router.dart';
import 'package:aliyun_oss_handler/router/router_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InitPage extends PageNodeProvider<InitPageProvider> {
  @override
  Widget buildContent(BuildContext context) => _InitPageContent(mProvider);
}

class _InitPageContent extends BasePageContentView<InitPageProvider> {
  _InitPageContent(InitPageProvider provider) : super(provider);

  @override
  _InitPageContentState createState() => _InitPageContentState();
}

class _InitPageContentState extends BasePageContentViewState<InitPageProvider> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Fluttertoast.showToast(
        msg: 'Turn to home page ...',
        gravity: ToastGravity.BOTTOM,
      );
      Future.delayed(Duration(seconds: 1)).then((value) {
        RouteWrapper.pushNamed(routerNameHomePage, arguments: ['HomePage']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome',
        ),
      ),
    );
  }
}
