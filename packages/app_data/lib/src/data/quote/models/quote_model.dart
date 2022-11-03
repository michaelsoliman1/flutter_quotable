import 'package:app_domain/app_domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_model.g.dart';

// Why`IMPLEMENT` Quote?
// since the name of one of our fields is not the same as the api,
// we want to stick to our domain names, we have two options here,
// the first one is implementing the [Quote] interface like below,
// or second, overriding only the field we want to rename, like in the this issue,
// https://github.com/google/json_serializable.dart/issues/1073
// both have some drawbacks
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
