import 'package:flutter/material.dart';
import 'package:quoter/models/quote.dart';

class QuoteView extends StatelessWidget {
  final Quote quote;
  final double padding;

  const QuoteView(this.quote, {Key? key, this.padding = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(children: <Widget>[
        Text(quote.body,
            style: TextStyle(color: Theme.of(context).colorScheme.primaryVariant, fontSize: Theme.of(context).textTheme.headline3?.fontSize)),
        Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              quote.author,
              style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Theme.of(context).textTheme.headline4?.fontSize),
            ),
        ),
      ]),
    );
  }
}
