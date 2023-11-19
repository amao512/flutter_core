import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/core/data/network/network_exceptions.dart';
import 'package:flutter_core/core/ui/bloc/state/simple_base_state.dart';

class BaseCubit<T> extends Cubit<BaseState<T>> {
  BaseCubit({BaseState<T>? initialState})
      : super(initialState ?? BaseState.initial());

  launch<R>(
    Future<Either<Failure, R>> usecase, {
    required Function(R) onResult,
    Function(Failure)? onError,
  }) async {
    emit(BaseState.loading(true));
    final response = await usecase;

    response.fold(
      (l) {
        emit(BaseState.loading(false));
        if (onError == null) {
          emit(BaseState.error(l));
        } else {
          onError(l);
        }
      },
      (r) {
        emit(BaseState.loading(false));
        onResult(r);
      },
    );
  }
}
