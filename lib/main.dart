import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qoutes/core/services/storage/local_storage.dart';

import 'core/theme/theme.dart';
import 'screens/home/home_screen.dart';

void main() async {
  runApp(QoutesApp());
}

class QoutesApp extends StatelessWidget {
  const QoutesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Programming Qoutes",
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
