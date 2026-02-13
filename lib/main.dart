

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mosques_teacher/src/app/app.dart';
import 'package:mosques_teacher/src/core/hive/hive_setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Hive.initFlutter();
  await HiveSetup.registerAdaptersAndOpenBoxes();

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MosquesTeacherApp());
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
