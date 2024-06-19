import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'app.dart';
import 'injection.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(const App());
}
