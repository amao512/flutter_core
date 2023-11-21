import 'package:flutter_core/core/data/network/network_exceptions.dart';

class ResultApi<T> {
  ResultApi({
    required this.data,
    required this.errors,
  });

  T? data;
  List<Failure>? errors;
}
