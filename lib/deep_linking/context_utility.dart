import 'package:flutter/cupertino.dart';

class ContextUtility {
  static final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigator;

  static NavigatorState? get navigator => navigatorKey.currentState;

  static BuildContext? get context => navigator?.overlay?.context;
}
