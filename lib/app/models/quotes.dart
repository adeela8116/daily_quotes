class Quote {
  final String content;
  final String author;

  Quote({required this.content, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['q'],
      author: json['a'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Quote &&
              runtimeType == other.runtimeType &&
              content == other.content &&
              author == other.author;

  @override
  int get hashCode => content.hashCode ^ author.hashCode;
}