import 'package:flutter/material.dart';

abstract class DataController<T> extends ChangeNotifier {
  T? _data;

  set setData(T value) {
    _data = value;
    notifyListeners();
  }

  T? get data => _data;
}

class AppDataController extends DataController<Map<String, dynamic>> {}
