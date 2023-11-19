import 'package:dio/dio.dart';
import 'package:flutter_core/core/ui/constants/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_exceptions.g.dart';

abstract class Failure {
  NetworkExceptions get exception;
}

class ServerFailure extends Failure {
  Response? response;

  ServerFailure({this.response});

  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: response?.statusCode,
        response: response,
    showMainError: true,
      );
}

class DioFailure extends Failure {
  Response? response;

  DioFailure({this.response});

  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: response?.statusCode,
        response: response,
        showMainError: true,
      );
}

class NoConnectionFailure extends Failure {
  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: -3,
        showMainError: true,
      );
}

class ServerException implements Exception {
  Response? response;

  ServerException({this.response});
}

class CustomFailure implements Failure {
  String title;
  String message;

  CustomFailure(this.title, this.message);

  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: -2,
        title: title,
        message: message,
      );
}

class EmptyFailure implements Failure {
  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: -2,
        title: CoreConstants.empty,
        message: CoreConstants.empty,
      );
}

class NetworkExceptions {
  late String title;
  late String message;
  final int? statusCode;
  Response? response;
  ErrorMessage? networkErrors;
  bool showMainError = false;

  NetworkExceptions({
    this.statusCode = -3,
    this.response,
    this.title = '',
    this.message = '',
    this.showMainError = false,
  }) {
    switch (statusCode) {
      case -1:
        message = 'Refresh the page';
        title = 'Empty page';
        showMainError = true;
        break;
      case -2:
        message = message;
        title = title;
        showMainError = false;
        break;
      case -3:
        message = 'Ошибка сервера';
        title = 'Ошибка';
        showMainError = false;
        break;
      case 413:
        message = 'Размер файла слишком большой';
        title = 'Ошибка';
        showMainError = false;
        break;
      case 500:
        message = 'Ошибка сервера';
        title = 'Ошибка сервера';
        showMainError = true;
        break;
      case 501:
        message = 'Ошибка сервера';
        title = 'Ошибка сервера';
        showMainError = true;
        break;
      case 502:
        message = 'Ошибка сервера';
        title = 'Ошибка сервера';
        showMainError = true;
        break;
      case 503:
        message = 'Ошибка сервера';
        title = 'Ошибка сервера';
        showMainError = true;
        break;
      default:
        title = "Ошибка";
        message = _parseErrorMessage(response);
        break;
    }
  }

  @override
  String toString() => message;

  String _parseErrorMessage(Response? response) {
    String _localError = '';
    try {
      networkErrors = ErrorMessage.fromJson(response?.data);
      _localError = networkErrors?.message ??
          networkErrors?.errorDescription ??
          response?.data.toString() ??
          'Ошибка сервера';
    } catch (e) {
      _localError = 'Ошибка сервера';
    }
    return _localError;
  }
}

@JsonSerializable()
class ErrorMessage {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'error')
  String? error;
  @JsonKey(name: 'error_description')
  String? errorDescription;

  ErrorMessage({
    this.message,
    this.code,
    this.error,
    this.errorDescription,
  });

  factory ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorMessageToJson(this);
}
