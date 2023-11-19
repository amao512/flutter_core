import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/core/data/network/network_exceptions.dart';
import 'package:flutter_core/core/ui/bloc/state/simple_base_state.dart';
import 'package:flutter_core/core/ui/constants/constants.dart';
import 'package:flutter_core/core/utils/load_utils.dart';

class CoreBlocConsumer<B extends StateStreamable<S>, S extends BaseState>
    extends BlocConsumer<B, S> {
  CoreBlocConsumer({
    super.key,
    bool showError = true,
    bool showLoader = false,
    super.buildWhen,
    Function(BuildContext, S)? listener,
    Widget? Function(BuildContext, S)? builder,
  }) : super(
          listener: (context, state) {
            listener?.call(context, state);

            if (showError && state.status == StateStatus.error) {
              showSnackBarError(context, state.error);
            }

            if (showLoader && state.status == StateStatus.loading) {
              LoaderUtils(context).showLoader(state.showLoader);
            }
          },
          builder: (context, state) {
            if (builder != null) {
              return builder(context, state) ?? const SizedBox.shrink();
            }

            return const SizedBox.shrink();
          },
        );
}

showSnackBarError(BuildContext context, Failure? error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Column(
      children: [
        Text(
          error?.exception.title ?? CoreConstants.empty,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          error?.exception.message ?? CoreConstants.empty,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    ),
  ));
}