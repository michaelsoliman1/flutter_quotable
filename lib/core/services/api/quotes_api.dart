import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:quotes/app/models/quote.dart';

const baseUrl = 'https://api.quotable.io';

Future<List<Quote>> fetchQuotes() async {
  final response = await http.get(
    Uri.parse('$baseUrl/quotes'),
  );

  if (response.statusCode == 200) {
    final parsedBody = json.decode(response.body) as Map<String, dynamic>;

    // this line and the one above are doing the same thing regarding casting
    // but this one is more preferable, because it's cleaner
    // usually, you don't need to cast your variables, dart will work on dynamics and will do
    // the same thing. but when casting, you just tell the compiler more info to work with,
    // which is definetly better.
    final results = parsedBody['results'] as List;
    final quotes = results.map<Quote>((map) => Quote.fromMap(map as Map<String, dynamic>)).toList();
    return quotes;
  } else {
    log('REQUEST FAILED : STATUS CODE ${response.statusCode}, ERROR: ${response.body}');

    // important for future listener to know when an error happens
    return Future.error(response.statusCode);
  }
}
