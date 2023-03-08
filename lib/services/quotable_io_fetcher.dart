import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quoter/models/quote.dart';
import 'package:quoter/services/quote_fetcher.dart';
import 'dart:math';

class QuotableIoFetcher implements QuoteFetcher {
  String? _previousBody;

  @override
  Future<Quote> fetch() async {
    final response = await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      if (Random().nextInt(3) == 0 || _previousBody == null) _previousBody = response.body;
      final json = jsonDecode(_previousBody!);
      return Quote(json['content'], json['author']);
    } else {
      throw Exception(response.reasonPhrase!);
    }
  }
}
