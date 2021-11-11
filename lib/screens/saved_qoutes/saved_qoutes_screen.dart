import 'package:flutter/material.dart';

class SavedQoutesScreen extends StatefulWidget {
  const SavedQoutesScreen({Key? key}) : super(key: key);

  @override
  _SavedQoutesScreenState createState() => _SavedQoutesScreenState();
}

class _SavedQoutesScreenState extends State<SavedQoutesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Qoutes"),
      ),
      body: Center(
        child: Text(
          "Save a qoute to add it here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
