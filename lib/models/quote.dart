class Quote {
  final String body;
  final String author;

  Quote(this.body, this.author);

  factory Quote.none() {
    return Quote("", "");
  }

  @override
  bool operator ==(Object other) => other is Quote && (body == other.body && author == other.author);

  @override
  int get hashCode => body.hashCode ^ author.hashCode;
  //int get hashCode => (body + author).hashCode;   // Other way but less efficient
}
