// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerResponse _$ServerResponseFromJson(Map<String, dynamic> json) =>
    ServerResponse(
      result: ServerResponse.resultReadValue(json, 'result')
              as Map<String, dynamic>? ??
          const {},
    );

Map<String, dynamic> _$ServerResponseToJson(ServerResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

ServerPageResponse _$ServerPageResponseFromJson(Map<String, dynamic> json) =>
    ServerPageResponse(
      count: json['count'] as int,
      totalCount: json['totalCount'] as int,
      page: json['page'] as int,
      totalPages: json['totalPages'] as int,
      lastItemIndex: json['lastItemIndex'] as int,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ServerPageResponseToJson(ServerPageResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'totalCount': instance.totalCount,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'lastItemIndex': instance.lastItemIndex,
      'result': instance.result,
    };
