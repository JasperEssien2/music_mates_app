import 'package:flutter/material.dart';

class AppDataController extends ChangeNotifier {
  final Map<String, dynamic> _data = {};

  set updateData(Map<String, dynamic> value) {
    _data.addAll(value);
    notifyListeners();
  }

  Map<String, dynamic> get data => _data;
}
