class Quotes{
  final String author;
  final String quote;

  Quotes({this.author, this.quote});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
        author: json['contents']['quotes'][0]['author'],
        quote: json['contents']['quotes'][0]['quote']);
  }

}