class Quote {
  final String body;
  final String author;

  Quote(this.body, this.author);

  factory Quote.none() {
    return Quote("", "");
  }
}
