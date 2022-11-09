import 'package:app_domain/app_domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_model.g.dart';

// Why`IMPLEMENT` Quote?
// since the name of one of our fields is not the same as the api,
// we want to stick to our domain names, we override only the field we want to rename (id in our case),
// and annonate it with `@JsonKey(name: '_id')`.
// https://github.com/google/json_serializable.dart/issues/1073
@JsonSerializable()
class QuoteModel extends Quote {
  const QuoteModel({
    required super.author,
    required super.content,
    required super.id,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);

  @override
  @JsonKey(name: '_id')
  String get id;
}
