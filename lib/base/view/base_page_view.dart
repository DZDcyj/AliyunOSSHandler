///
/// base_page_view
///
/// created by DZDcyj at 2021/8/29
///
import 'package:dartin/dartin.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class PageNodeProvider<T extends ChangeNotifier>
    extends StatelessWidget {
  final T mProvider;

  PageNodeProvider({Key key, List<dynamic> params})
      : mProvider = inject<T>(params: params),
        super(key: key);

  @mustCallSuper
  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: mProvider,
      child: buildContent(context),
    );
  }
}

class BasePageView<T extends ChangeNotifier> extends StatefulWidget {
  BasePageView(T provider, {Key key})
      : mProvider = provider,
        super(key: key);

  final T mProvider;

  @override
  BasePageViewState createState() => BasePageViewState();
}

class BasePageViewState<T extends ChangeNotifier>
    extends State<BasePageView<T>> {
  T mProvider;

  void initState() {
    mProvider = widget.mProvider;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: mProvider,
    );
  }
}
