import 'package:get_it/get_it.dart';
import 'package:quoter/models/quote.dart';

class FavoriteQuoteManager {
  final _quotes = <Quote>[];

  List<Quote> get quotes => _quotes;

  void add(Quote quote) {
    _quotes.add(quote);
  }

  void remove(Quote quote) {
    _quotes.remove(quote);
  }
  
  bool contains(Quote quote) {
    return _quotes.contains(quote);
  }

  static void register() {
    GetIt.I.registerLazySingleton(() => FavoriteQuoteManager());
  }

  static FavoriteQuoteManager get instance => GetIt.I.get<FavoriteQuoteManager>();
}
