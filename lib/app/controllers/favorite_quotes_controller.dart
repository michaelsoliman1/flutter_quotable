import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/services/storage/local_storage.dart';
import '../models/quote.dart';
import '../shared/helpers/ui_helper.dart';

class FavoriteQuotesController extends ChangeNotifier {
  bool isFavouritesLoading = false;
  bool isFavouritesError = false;

  final _favouriteQuotes = <Quote>[];
  List<Quote> get favouriteQuotes => _favouriteQuotes;

  Future<void> addQuoteToFavourite({required BuildContext context, required Quote quote}) async {
    try {
      // check if the qoute is already added
      if (_favouriteQuotes.any((_quote) => _quote.id == quote.id)) {
        UIHelper.showSnackBar(context, "Qoute Already Saved!");
        return;
      }
      await Storage.saveQuoteToStorage(quote);
      _favouriteQuotes.add(quote);
      UIHelper.showSnackBar(context, "Qoute Saved Successfully");
    } catch (error) {
      UIHelper.showSnackBar(context, error.toString());
    }
  }

  Future<void> removeQouteFromFavourite({required BuildContext context, required String id}) async {
    try {
      await Storage.removeQuoteFromStorage(id);
      _favouriteQuotes.removeWhere((quote) => quote.id == id);
      UIHelper.showSnackBar(context, "Qoute Removed From Favourites!");
    } catch (error) {
      UIHelper.showSnackBar(context, error.toString());
    }
  }

  Future<void> loadFavouriteQuotes() async {
    try {
      isFavouritesLoading = true;
      _favouriteQuotes.clear();
      final qoutes = await Storage.loadQuotesFromStorage();
      _favouriteQuotes.addAll(qoutes);
      isFavouritesError = false;
    } catch (e) {
      print(e);
      isFavouritesError = true;
    }
    isFavouritesLoading = false;
    notifyListeners();
  }

  Future<void> eraseAllQuotes() async {
    try {
      isFavouritesLoading = true;
      await Storage.eraseAllQuotes();
      _favouriteQuotes.clear();
      isFavouritesError = false;
    } catch (e) {
      print(e);
      isFavouritesError = true;
    }
    isFavouritesLoading = false;
    notifyListeners();
  }
}
