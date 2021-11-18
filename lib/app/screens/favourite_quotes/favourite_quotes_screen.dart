import 'package:flutter/material.dart';

import '../../../core/services/storage/local_storage.dart';
import '../../models/quote.dart';
import '../../shared/widgets/error_view_widget.dart';
import '../../shared/widgets/loading_indicator_widget.dart';
import 'components/favourite_quote_item.dart';

class FavouriteQuotesScreen extends StatefulWidget {
  const FavouriteQuotesScreen({Key? key}) : super(key: key);

  @override
  _FavouriteQuotesScreenState createState() => _FavouriteQuotesScreenState();
}

class _FavouriteQuotesScreenState extends State<FavouriteQuotesScreen> {
  final _savedQoutes = <Quote>[];

  bool _isLoading = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _loadSavedQoutes();
  }

  Future<void> _loadSavedQoutes() async {
    try {
      setState(() {
        _isLoading = true;
      });
      _savedQoutes.clear();
      final qoutes = await Storage.loadQoutesFromStorage();
      setState(() {
        _savedQoutes.addAll(qoutes);
        _isLoading = false;
        _isError = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    }
  }

  Future<void> _eraseAllQoutes() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Storage.eraseAllQoutes();
      setState(() {
        _savedQoutes.clear();
        _isLoading = false;
        _isError = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Qoutes"),
      ),
      body: _isLoading
          ? LoadingIndicator()
          : _isError
              ? ErrorView(onButtonPress: () => _loadSavedQoutes())
              : _savedQoutes.isEmpty
                  ? emptyView
                  : ListView.builder(
                      itemCount: _savedQoutes.length,
                      itemBuilder: (context, index) {
                        return FavouriteQuoteItem(qoute: _savedQoutes[index]);
                      },
                    ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _loadSavedQoutes();
            },
            child: Icon(Icons.refresh),
          ),
          SizedBox(width: 5),
          FloatingActionButton(
            onPressed: () {
              _eraseAllQoutes();
            },
            child: Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
    );
  }

  Widget get emptyView => Center(
        child: Text(
          "Favourite qoutes to show them here",
          style: TextStyle(fontSize: 20),
        ),
      );
}
