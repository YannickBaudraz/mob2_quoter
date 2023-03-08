import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:quoter/models/quote.dart';

// Mixes ChangeNotifier in so that this manager may be `watch`ed by GetItMixin.
// We can't simply wrap the `_quotes` collection with a ValueNotifier because the
// value itself does not change (the value is the collection, the collection items not!)
class FavoriteQuoteManager with ChangeNotifier {
  final _quotes = <Quote>[];

  List<Quote> get quotes => _quotes;

  void add(Quote quote) {
    _quotes.add(quote);
    notifyListeners();
  }

  void remove(Quote quote) {
    _quotes.remove(quote);
    notifyListeners();
  }
  
  bool contains(Quote quote) {
    return _quotes.contains(quote);
  }

  static void register() {
    GetIt.I.registerLazySingleton(() => FavoriteQuoteManager());
  }

  static FavoriteQuoteManager get instance => GetIt.I.get<FavoriteQuoteManager>();
}
