import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/qoute.dart';
import '../../constants/constants.dart';

class Storage {
  static final _addedQoutes = <String>[];

  static Future<void> saveQouteToStorage(Qoute qoute) async {
    // if the qoute is already added return an error
    if (_addedQoutes.any((element) => element == qoute.id)) {
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
    _addedQoutes.add(qoute.id);
    prefs.setStringList(Constants.QOUTES_KEY, qoutes);
  }

  static Future<void> eraseAllQoutes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
