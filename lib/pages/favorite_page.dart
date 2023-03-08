import 'package:flutter/material.dart';
import 'package:quoter/managers/favorite_quote_manager.dart';
import 'package:quoter/widgets/quote_view.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote"),
      ),
      body: _buildQuoteList(context),
      floatingActionButton: FloatingActionButton(
        onPressed:() => Navigator.pop(context),
        tooltip: 'Dismiss',
        child: const Icon(Icons.close),
      ),
    );
  }

  Widget _buildQuoteList(BuildContext context) {
    return ListView(
      children: FavoriteQuoteManager.instance.quotes.map(QuoteView.new).toList(),
    );
  }
}

