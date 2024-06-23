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
      count: (json['count'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      pageIndex: (json['page'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      lastItemIndex: (json['lastItemIndex'] as num).toInt(),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ServerPageResponseToJson(ServerPageResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'totalCount': instance.totalCount,
      'page': instance.pageIndex,
      'totalPages': instance.totalPages,
      'lastItemIndex': instance.lastItemIndex,
      'results': instance.results,
    };
