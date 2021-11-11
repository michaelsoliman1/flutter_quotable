import 'dart:convert';

class Qoute {
  String id;
  String content;
  String author;

  Qoute({
    required this.id,
    required this.author,
    required this.content,
  });

  factory Qoute.fromJson(String source) => Qoute.fromMap(json.decode(source));

  factory Qoute.fromMap(Map<String, dynamic> map) {
    return Qoute(
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
