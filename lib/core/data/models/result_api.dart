import 'package:flutter_core/core/data/network/network_exceptions.dart';

class ResultApi<T> {
  ResultApi({
    this.data,
    this.errors,
  });

  T? data;
  List<Failure>? errors;
}
