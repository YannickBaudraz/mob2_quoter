import 'package:quoter/models/quote.dart';

abstract class QuoteFetcher {
  Future<Quote> fetch();
}
