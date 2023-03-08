import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import 'package:quoter/managers/quote_flow_manager.dart';
import 'package:quoter/models/quote.dart';

import 'package:quoter/widgets/quote_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote"),
      ),
      body: _QuoteFlowView(),
      floatingActionButton: FloatingActionButton(
        onPressed: QuoteFlowManager.instance.next,
        tooltip: 'New quote',
        child: const Icon(Icons.subdirectory_arrow_left),
      ),
    );
  }
}

class _QuoteFlowView extends StatelessWidget with GetItMixin {
  _QuoteFlowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Connects the the QuoteFlowManager event stream
    AsyncSnapshot<Quote> snapshot = watchStream((QuoteFlowManager m) => m.stream, Quote.none());

    return SingleChildScrollView(
      child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 100,
          ),
          child: Center(
            child: _buildSnapshot(context, snapshot),
          ),
        ),
    );
  }

  Widget _buildSnapshot(BuildContext context, AsyncSnapshot<Quote> snapshot) {
    if (snapshot.hasData) {
      return QuoteView(snapshot.data!);
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}', style: TextStyle(color: Theme.of(context).errorColor, fontSize: Theme.of(context).textTheme.headline3?.fontSize));
    }
    return const CircularProgressIndicator();
  }
}
