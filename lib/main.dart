import 'package:flutter/material.dart';
import 'package:gallery_test/askm_app.dart';
import 'package:gallery_test/service_locator.dart';

void main() {
  setupServicesLocator();
  runApp(const AskmApp());
}
