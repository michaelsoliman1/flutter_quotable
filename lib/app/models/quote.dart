import 'dart:convert';

class Quote {
  String id;
  String content;
  String author;

  Quote({
    required this.id,
    required this.author,
    required this.content,
  });

  factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source));

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['_id'],
      author: map['author'],
      content: map['content'],
    );
  }

  @override
  String toString() => 'Qoute(id: $id, author: $author, en: $content)';

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'author': author,
      'content': content,
    };
  }

  String toJson() => json.encode(toMap());
}
