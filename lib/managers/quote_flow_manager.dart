import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:quoter/models/quote.dart';
import 'package:quoter/services/quotable_io_fetcher.dart';
import 'package:quoter/services/quote_fetcher.dart';

class QuoteFlowManager {
  final QuoteFetcher _fetcher;
  late final StreamController<Quote> _streamController;

  QuoteFlowManager(this._fetcher) {
    _streamController = StreamController();
    next();
  }

  Stream<Quote> get stream => _streamController.stream;

  void next() async {
    _streamController.add(await _fetcher.fetch());
  }

  static void register() {
    GetIt.I.registerLazySingleton(() => QuoteFlowManager(QuotableIoFetcher()));
  }

  static QuoteFlowManager get instance => GetIt.I.get<QuoteFlowManager>();
}
