import 'package:flutter/material.dart';
import 'package:flutter_uikit/di/dependency_injection.dart';
import 'package:flutter_uikit/myapp.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ///模拟数据
  Injector.configure(Flavor.PRO);
  runApp(MyApp());
}
