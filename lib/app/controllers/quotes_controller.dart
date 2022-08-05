import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/services/api/quotes_api.dart';
import '../models/quote.dart';

class QuotesController extends ChangeNotifier {
  bool isLoading = false;
  bool isError = false;

  final _quotes = <Quote>[];
  List<Quote> get quotes => _quotes;

  Future<void> getQuotes() async {
    isLoading = true;
    try {
      final quotes = await fetchQuotes();
      _quotes.addAll(quotes);
      isError = false;
    } catch (e) {
      isError = true;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> refreshQuotes() {
    _clearQuotes();
    return getQuotes();
  }

  void _clearQuotes() {
    _quotes.clear();
    notifyListeners();
  }
}
