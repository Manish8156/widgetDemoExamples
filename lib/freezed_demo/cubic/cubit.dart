import 'dart:ui';

import 'package:widgets_demo_examples/freezed_demo/cubic/cubic_page_state.dart';
import 'package:bloc/bloc.dart';

class CubitDemo extends Cubit<CubicPageState> {
  CubitDemo() : super(const CubicPageState());

  void addNumber() {
    emit(CubicPageState(cubicStates: state.cubicStates));
  }
}
