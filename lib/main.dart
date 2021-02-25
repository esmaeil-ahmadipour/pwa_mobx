import 'package:flutter/material.dart';
import 'package:pwa_mobx/my_app.dart';
import 'package:pwa_mobx/utils/service_locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}