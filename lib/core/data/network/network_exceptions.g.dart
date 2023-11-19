// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_exceptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) => ErrorMessage(
      message: json['message'] as String?,
      code: json['code'] as String?,
      error: json['error'] as String?,
      errorDescription: json['error_description'] as String?,
    );

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'error': instance.error,
      'error_description': instance.errorDescription,
    };
