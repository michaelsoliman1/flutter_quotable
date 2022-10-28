import 'dart:convert';

class Quote {
  Quote({
    required this.id,
    required this.author,
    required this.content,
  });

  factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['_id'] as String,
      author: map['author'] as String,
      content: map['content'] as String,
    );
  }
  String id;
  String content;
  String author;

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
