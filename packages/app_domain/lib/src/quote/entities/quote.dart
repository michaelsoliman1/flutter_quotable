import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  const Quote({
    required this.id,
    required this.author,
    required this.content,
  });

  final String id;
  final String content;
  final String author;

  @override
  List<Object?> get props => [id];
}
