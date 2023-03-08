import 'package:flutter/material.dart';
import 'package:quoter/managers/favorite_quote_manager.dart';
import 'package:quoter/managers/quote_flow_manager.dart';
import 'package:quoter/pages/home_page.dart';

void main() {
  QuoteFlowManager.register();
  FavoriteQuoteManager.register();
  runApp(const QuoterApp());
}

class QuoterApp extends StatelessWidget {
  const QuoterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quoter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
