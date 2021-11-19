import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/controllers/quotes_controller.dart';
import 'app/home_screen.dart';
import 'core/theme/theme.dart';

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
      home: ChangeNotifierProvider(
        create: (context) => QuotesController(),
        child: HomeScreen(),
      ),
    );
  }
}
