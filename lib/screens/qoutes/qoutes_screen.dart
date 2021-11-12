import 'package:flutter/material.dart';

import '../../core/services/api/qoutes_api.dart';
import '../../models/qoute.dart';
import '../../shared/widgets/error_view_widget.dart';
import '../../shared/widgets/loading_indicator_widget.dart';
import 'components/qoute_item.dart';

class QoutesScreen extends StatefulWidget {
  const QoutesScreen({Key? key}) : super(key: key);

  @override
  _QoutesScreenState createState() => _QoutesScreenState();
}

class _QoutesScreenState extends State<QoutesScreen> {
  bool _isLoading = false;
  bool _isError = false;

  // TODO implement
  final _page = 0;

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
        onRefresh: () async {
          _qoutes.clear();
          _getQoutes();
        },
        child: _isLoading
            ? LoadingIndicator()
            : _isError
                ? ErrorView(onButtonPress: () => _getQoutes())
                : ListView.builder(
                    itemCount: _qoutes.length,
                    itemBuilder: (context, index) {
                      return QouteItem(qoute: _qoutes[index]);
                    },
                  ),
      ),
    );
  }
}
