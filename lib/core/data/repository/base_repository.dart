import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_core/core/data/models/result_api.dart';
import 'package:flutter_core/core/data/network/network_exceptions.dart';
import 'package:logger/logger.dart';

abstract class BaseRepository {
  Future<ResultApi<T>> call<T>(Future<T> apiCall) async {
    try {
      var result = await apiCall;
      return ResultApi(data: result);
    } on ServerException catch (exception) {
      _printError("ServerException $exception");
      return ResultApi(errors: [ServerFailure(response: exception.response)]);
    } on DioError catch (exception) {
      _printError("Dio Error $exception");
      return ResultApi(errors: [DioFailure(response: exception.response)]);
    } on SocketException {
      _printError("SocketException");
      return ResultApi(errors: [NoConnectionFailure()]);
    } on Exception {
      _printError("NoConnectionFailure");
      return ResultApi(errors: [NoConnectionFailure()]);
    } catch (exception) {
      _printError("NoConnectionFailure");
      return ResultApi(errors: [NoConnectionFailure()]);
    }
  }

  _printError(String? error) {
    if (kDebugMode) {
      Logger().d("Exception = $error");
    }
  }
}