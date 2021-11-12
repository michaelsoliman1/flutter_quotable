import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';
import '../../../core/services/storage/local_storage.dart';
import '../../../models/qoute.dart';

class QouteItem extends StatefulWidget {
  const QouteItem({
    Key? key,
    required this.qoute,
  }) : super(key: key);

  final Qoute qoute;

  @override
  _QouteItemState createState() => _QouteItemState();
}

class _QouteItemState extends State<QouteItem> {
  bool _isAdded = false;

  Future<void> _saveQoute() async {
    try {
      await Storage.saveQouteToStorage(widget.qoute);
      setState(() {
        _isAdded = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Qoute Saved Successfully"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(
        left: Constants.DEFAULT_PADDING,
        right: Constants.DEFAULT_PADDING,
        top: Constants.DEFAULT_PADDING,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.DEFAULT_PADDING),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.qoute.content,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(widget.qoute.author),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: InkWell(
              onTap: () {
                _saveQoute();
              },
              borderRadius: BorderRadius.circular(10),
              child: Icon(
                _isAdded ? Icons.bookmark_add : Icons.bookmark_add_outlined,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
