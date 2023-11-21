import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/core/data/models/result_api.dart';
import 'package:flutter_core/core/data/network/network_exceptions.dart';
import 'package:flutter_core/core/ui/bloc/state/base_state.dart';

class BaseCubit<T> extends Cubit<BaseState<T>> {
  BaseCubit({BaseState<T>? initialState})
      : super(initialState ?? BaseState.initial());

  launch<R>(
    Future<ResultApi<R>> call, {
    required Function(R) onResult,
    Function(Failure)? onError,
    bool showError = true,
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(BaseState.loading(true));
    }

    final response = await call;

    if (showLoading) {
      emit(BaseState.loading(false));
    }

    if (response.errors != null && response.errors?.isNotEmpty == true) {
      if (showError) {
        emit(BaseState.error(response.errors!.first));
      }

      if (onError != null) {
        onError(response.errors!.first);
      }
    }

    if (response.data != null) {
      onResult(response.data as R);
    }
  }
}
