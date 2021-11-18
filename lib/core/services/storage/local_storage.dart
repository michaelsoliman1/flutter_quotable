import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/models/quote.dart';
import '../../../app/shared/constants/constants.dart';

class Storage {
  static final _savedQoutes = <String>[];

  static Future<void> saveQouteToStorage(Quote qoute) async {
    // if the qoute is already added return an error
    if (_savedQoutes.any((element) => element == qoute.id)) {
      return Future.error("Qoute Already Saved!");
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var qoutes = prefs.getStringList(Constants.QOUTES_KEY);

    if (qoutes != null) {
      // add qoute to list
      qoutes.add(qoute.toJson());
    } else {
      // create new list and append to it
      // the .. is short syntax for creating a list on a line and accessing it on a different line
      qoutes = []..add(qoute.toJson());
    }
    _savedQoutes.add(qoute.id);
    prefs.setStringList(Constants.QOUTES_KEY, qoutes);
  }

  static Future<List<Quote>> loadQoutesFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var qoutes = prefs.getStringList(Constants.QOUTES_KEY);
    if (qoutes != null) {
      return qoutes.map((qoute) => Quote.fromJson(qoute)).toList();
    }
    // there is no saved qoutes
    return Future.value([]);
  }

  static Future<void> eraseAllQoutes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    _savedQoutes.clear();
  }
}
