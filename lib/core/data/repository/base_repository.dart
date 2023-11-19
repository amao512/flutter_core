import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_core/core/data/network/network_exceptions.dart';
import 'package:logger/logger.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> call<T>(Future<T> apiCall) async {
    try {
      var result = await apiCall;
      return Right(result);
    } on ServerException catch (exception) {
      _printError("ServerException $exception");
      return Left(ServerFailure(response: exception.response));
    } on DioError catch (exception) {
      _printError("Dio Error $exception");
      return Left(DioFailure(response: exception.response));
    } on SocketException {
      _printError("SocketException");
      return Left(NoConnectionFailure());
    } on Exception {
      _printError("NoConnectionFailure");
      return Left(NoConnectionFailure());
    } catch (exception) {
      _printError("NoConnectionFailure");
      return Left(NoConnectionFailure());
    }
  }

  _printError(String? error) {
    if (kDebugMode) {
      Logger().d("Exception = $error");
    }
  }
}