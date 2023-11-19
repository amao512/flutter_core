import 'package:dartz/dartz.dart';
import 'package:flutter_core/core/data/network/network_exceptions.dart';

abstract class UseCase {
  launch<T>({
    required Future<T> Function() block,
    required Function(T) result,
    required Function(Failure) error,
  }) async {
    var value = await block();

    result(value);
  }
}

extension LaunchExtension on Either<Failure, Object> {
  launch<T>({
    required Function(Future<T>) showResult,
    required Function(Failure) showError,
    required Function(bool) showLoading,
  }) {
    // todo
  }
}

abstract class LaunchUseCase<Type> {
  Future<Either<Failure, Type>> call();
}

abstract class LaunchUseCaseWithParam<Param, Type> extends UseCase {
  Future<Either<Failure, Type>> call(Param param);
}
