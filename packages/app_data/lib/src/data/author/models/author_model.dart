import 'package:app_domain/app_domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel extends Author {
  AuthorModel({
    required super.id,
    required super.bio,
    required super.description,
    required super.link,
    required super.name,
    required super.slug,
    required super.quoteCount,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);

  @override
  @JsonKey(name: '_id')
  String get id;
}
