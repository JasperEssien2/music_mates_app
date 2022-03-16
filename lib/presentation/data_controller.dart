import 'package:flutter/material.dart';

abstract class DataController<T> extends ChangeNotifier {
  T? _data;

  set setData(T value) {
    _data = value;
    notifyListeners();
  }

  T? get data => _data;
}

class GraphQlDataController extends DataController<String> {}
