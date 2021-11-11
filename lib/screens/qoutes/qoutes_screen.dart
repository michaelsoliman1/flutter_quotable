import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/services/api/qoutes_api.dart';
import '../../models/qoute.dart';
import 'components/qoute_item.dart';

class QoutesScreen extends StatefulWidget {
  const QoutesScreen({Key? key}) : super(key: key);

  @override
  _QoutesScreenState createState() => _QoutesScreenState();
}

class _QoutesScreenState extends State<QoutesScreen> {
  bool _isLoading = false;
  bool _isError = false;

  final _qoutes = <Qoute>[];

  @override
  void initState() {
    super.initState();
    _getQoutes();
  }

  void _getQoutes() {
    setState(() {
      _isLoading = true;
    });
    // TODO change to await
    fetchQoutes().then((qoutes) {
      _isError = false;
      _qoutes.addAll(qoutes);
    }).onError((error, stackTrace) {
      setState(() {
        _isError = true;
      });
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Qoutes")),
      body: RefreshIndicator(
        onRefresh: () async => _getQoutes(),
        child: _isLoading
            ? center
            : _isError
                ? errorWidget
                : listView,
      ),
    );
  }

  Center get center => Center(child: CircularProgressIndicator.adaptive());

  ListView get listView => ListView.builder(
        itemCount: _qoutes.length,
        itemBuilder: (context, index) {
          return QouteItem(qoute: _qoutes[index]);
        },
      );

  Container get errorWidget => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(Constants.EMPTY_PAGE),
            ),
            Text(
              "Oops! Something Went Wrong!",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextButton(
              onPressed: () {
                _getQoutes();
              },
              child: Text("Refresh"),
            ),
          ],
        ),
      );
}
