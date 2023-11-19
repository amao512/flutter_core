import 'package:flutter_core/core/data/network/network_exceptions.dart';

class BaseState<T> {
  final T? result;
  final Failure? error;
  final StateStatus status;
  final bool showLoader;

  const BaseState._({
    this.result,
    this.error,
    this.status = StateStatus.initial,
    this.showLoader = false,
  });

  BaseState.initial() : this._(status: StateStatus.initial);

  BaseState.loading([bool showLoader = false])
      : this._(
          status: StateStatus.loading,
          showLoader: showLoader,
        );

  BaseState.error(Failure failure)
      : this._(
          status: StateStatus.error,
          error: failure,
        );

  BaseState.loaded(T result)
      : this._(
          status: StateStatus.loaded,
          result: result,
        );

  BaseState.success() : this._(status: StateStatus.success);
}

enum StateStatus { initial, loading, error, loaded, success }
