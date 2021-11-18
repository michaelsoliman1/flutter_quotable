import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/services/api/quotes_api.dart';
import '../../core/services/storage/local_storage.dart';
import '../models/quote.dart';
import '../shared/helpers/ui_helper.dart';

class QuotesController extends ChangeNotifier {
  final _quotes = <Quote>[];
  final _favouriteQuotes = <Quote>[];

  bool isLoading = false;
  bool isError = false;

  List<Quote> get quotes => _quotes;

  Future<void> getQuotes() async {
    isLoading = true;
    try {
      final qoutes = await fetchQuotes();
      _quotes.addAll(qoutes);
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

  Future<void> saveQoute({required BuildContext context, required Quote qoute}) async {
    try {
      await Storage.saveQouteToStorage(qoute);
      UIHelper.showSnackBar(context, "Qoute Saved Successfully");
    } catch (error) {
      UIHelper.showSnackBar(context, error.toString());
    }
  }

  void _clearQuotes() {
    _quotes.clear();
    notifyListeners();
  }
}
