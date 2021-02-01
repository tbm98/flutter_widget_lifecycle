library flutter_widget_lifecycle;

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LifeCycleWidget extends StatefulWidget {
  LifeCycleWidget({
    Key key,
    @required this.child,
    this.onAppear,
    this.onDisappear,
  })  : assert(child != null),
        super(key: key);

  final Widget child;
  final VoidCallback onAppear;
  final VoidCallback onDisappear;

  @override
  _LifeCycleWidgetState createState() => _LifeCycleWidgetState();
}

class _LifeCycleWidgetState extends State<LifeCycleWidget>
    with WidgetsBindingObserver {
  final _key = UniqueKey();
  VisibilityInfo _info;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      if (_isShowing()) {
        widget.onDisappear?.call();
      }
    } else if (state == AppLifecycleState.resumed) {
      if (_isShowing()) {
        widget.onAppear?.call();
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  bool _isShowing() {
    return (_info?.visibleFraction ?? 0) == 1;
  }

  bool _isHidden() {
    return (_info?.visibleFraction ?? 0) == 0;
  }

  void _handleVisibilityInfoChanged(VisibilityInfo info) {
    _info = info;

    if (info.visibleFraction == 1) {
      widget.onAppear?.call();
      return;
    }
    if (info.visibleFraction == 0) {
      widget.onDisappear?.call();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _key,
      onVisibilityChanged: _handleVisibilityInfoChanged,
      child: widget.child,
    );
  }
}
