///
/// router_constant
///
/// created by DZDcyj at 2021/9/14
///
import 'package:aliyun_oss_handler/page/homepage/view/homepage.dart';
import 'package:flutter/cupertino.dart';

const String routerNameHomePage = 'homepage';

final Map<String, Widget Function({List<dynamic> params})> routerMap = {
  routerNameHomePage: ({params}) => HomePage(params[0]),
};
