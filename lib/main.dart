import 'package:flutter/material.dart';

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
      title: "Qoutes",
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
