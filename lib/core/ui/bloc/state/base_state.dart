import 'package:equatable/equatable.dart';
import 'package:flutter_core/core/data/network/network_exceptions.dart';

class BaseState<T> extends Equatable {
  final T? result;
  final Failure? error;
  final StateStatus status;
  final bool showLoader;
  final dynamic value;

  const BaseState._({
    this.result,
    this.error,
    this.status = StateStatus.initial,
    this.showLoader = false,
    this.value,
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

  BaseState.success([dynamic value])
      : this._(
          status: StateStatus.success,
          value: value,
        );

  @override
  List<Object?> get props => [status];
}

enum StateStatus { initial, loading, error, loaded, success }
