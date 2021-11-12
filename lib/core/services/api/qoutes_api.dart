import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qoutes/models/qoute.dart';

const baseUrl = "https://api.quotable.io";

Future<List<Qoute>> fetchQoutes() async {
  final http.Response response = await http.get(
    Uri.parse("$baseUrl/quotes"),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> parsedBody = json.decode(response.body);

    // this line and the one above are doing the same thing regarding casting
    // but this one is more preferable, because it's cleaner
    // usually, you don't need to cast your variables, dart will work on dynamics and will do
    // the same thing. but when casting, you just tell the compiler more info to work with,
    // which is definetly better.
    final results = parsedBody['results'] as List;
    final qoutes = results.map((qoute) => Qoute.fromMap(qoute)).toList();
    return qoutes;
  } else {
    print("REQUEST FAILED : STATUS CODE ${response.statusCode}, ERROR: ${response.body}");

    // important for future listener to know when an error happens
    return Future.error([]);
  }
}
