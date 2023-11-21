import 'package:flutter_core/core/data/models/result_api.dart';

abstract class UseCase {
  ResultApi launch<T>(ResultApi? result, T Function() map) {
    return ResultApi(errors: result?.errors, data: map());
  }
}

abstract class LaunchUseCase<T> extends UseCase {
  Future<ResultApi<T>> call();
}

abstract class LaunchUseCaseWithParam<Param, T> extends UseCase {
  Future<ResultApi<T>> call(Param param);
}
