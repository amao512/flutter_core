import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/core/ui/bloc/state/base_state.dart';

class CoreBlocBuilder<B extends StateStreamable<S>, S extends BaseState>
    extends BlocBuilder<B, S> {
  CoreBlocBuilder({
    super.key,
    bool showLoader = false,
    required Widget? Function(BuildContext, S)? builder,
  }) : super(
          builder: (context, state) {
            if (showLoader && state.status == StateStatus.loading) {
              return const Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (builder != null) {
              return builder.call(context, state) ?? const SizedBox.shrink();
            }

            return const SizedBox.shrink();
          },
        );
}
