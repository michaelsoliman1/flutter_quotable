import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/models/quote.dart';
import '../../../app/shared/constants/constants.dart';

class Storage {
  static Future<void> saveQuoteToStorage(Quote quote) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var quotes = prefs.getStringList(Constants.QOUTES_KEY);

      if (quotes != null) {
        // add qoute to list
        quotes.add(quote.toJson());
      } else {
        // create new list and append to it
        // the .. is short syntax for creating a list on a line and accessing it on a different line
        quotes = []..add(quote.toJson());
      }
      await prefs.setStringList(Constants.QOUTES_KEY, quotes);
    } catch (e) {
      // usually we will not return the exception to the user
      // instead, we will map it to human readable error
      // but we'll return the error for the sake of the example
      return Future.error(e.toString());
    }
  }

  static Future<List<Quote>> loadQuotesFromStorage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var qoutes = prefs.getStringList(Constants.QOUTES_KEY);
      if (qoutes != null) {
        return qoutes.map((qoute) => Quote.fromJson(qoute)).toList();
      }
      // there is no saved qoutes
      // return a future of an empty list.
      // we return a future because this is an asynchronous function
      return Future.value([]);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<void> removeQuoteFromStorage(String id) async {
    try {
      // the following piece of code is not the best thing to do,
      // but usually all this stuff happens at server side,
      // so we'll also cope with it for the sake of the example
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // load quotes json
      var savedQuotes = prefs.getStringList(Constants.QOUTES_KEY);
      if (savedQuotes != null) {
        // decode jsons to Quotes objects
        final quotes = savedQuotes.map((quote) => Quote.fromJson(quote)).toList();
        // remove the passed quote
        quotes.removeWhere((quote) => quote.id == id);

        // encode list to json
        savedQuotes.clear();
        savedQuotes.addAll(
          // this map function iterate over the list and convert each object to json string
          // then we add the newly mapped list to savedQuotes
          quotes.map((quote) => quote.toJson()),
        );
        // save the list of json
        await prefs.setStringList(Constants.QOUTES_KEY, savedQuotes);
      }

      return Future.value([]);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<void> eraseAllQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
