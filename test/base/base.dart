///
/// base
///
/// created by DZDcyj at 2021/8/29
///
import 'package:flutter_test/flutter_test.dart';

Future<void> tap(WidgetTester tester, Finder finder) async {
  await tester.tap(finder);
  await tester.pump();
}
