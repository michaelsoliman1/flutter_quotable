import 'package:json_annotation/json_annotation.dart';
import 'package:quotes/app/quotes/domain/domain.dart';

part 'quote_model.g.dart';

@JsonSerializable()
class QuoteModel implements Quote {
  QuoteModel({
    required this.id,
    required this.author,
    required this.content,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);

  @override
  final String author;

  @override
  final String content;

  @override
  @JsonKey(name: '_id')
  final String id;
}
