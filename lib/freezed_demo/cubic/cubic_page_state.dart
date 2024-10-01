import 'package:freezed_annotation/freezed_annotation.dart';
part 'cubic_page_state.freezed.dart';

enum ViewState { initial, loading, loadingNext, error, success }

@freezed
class CubicPageState with _$CubicPageState {
  const factory CubicPageState({
    @Default(ViewState.initial) ViewState cubicStates,
    @Default(0) int value,
  }) = _CubicPageState;
}
