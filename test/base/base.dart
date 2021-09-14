import 'package:flutter/material.dart';

///
/// base
///
/// created by DZDcyj at 2021/8/29
///
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/cupertino.dart';

Future<void> tap(WidgetTester tester, Finder finder) async {
  await tester.tap(finder);
  await tester.pump();
}

Future<void> showWidget(WidgetTester tester, Widget widget, {Duration duration}) async {
  if (widget is! MediaQuery && widget is! MaterialApp) {
    widget = MaterialApp(
      home: widget,
    );
  }
  await tester.pumpWidget(widget);
  if (duration != null) {
    await tester.pumpAndSettle(duration);
  }
  await tester.pump();
}
