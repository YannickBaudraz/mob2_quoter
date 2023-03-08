import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quoter/models/quote.dart';
import 'package:quoter/services/quote_fetcher.dart';

class QuotableIoFetcher implements QuoteFetcher {

  @override
  Future<Quote> fetch() async {
    final response = await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Quote(json['content'], json['author']);
    } else {
      throw Exception(response.reasonPhrase!);
    }
  }
}
