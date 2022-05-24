import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class fitbit_data {
  double? list_data;

  // List<dynamic>? copy(steps) {
  //   list_data?.add(steps);
  //   return list_data;
  // }
  double? copy(steps) {
    list_data = steps;
    return list_data;
  }

  void stampa() {
    return print(list_data);
  }

  String? get getName {
    return list_data.toString();
  }

  double? value() {
    return list_data;
  }
}
