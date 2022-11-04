// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerResponse _$ServerResponseFromJson(Map<String, dynamic> json) =>
    ServerResponse(
      message: json['message'] as String? ?? '',
      responseCode: json['responseCode'] as String?,
      result: json['result'] as Map<String, dynamic>?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ServerResponseToJson(ServerResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'responseCode': instance.responseCode,
      'result': instance.result,
      'url': instance.url,
    };

ServerListResponse _$ServerListResponseFromJson(Map<String, dynamic> json) =>
    ServerListResponse(
      message: json['message'] as String? ?? '',
      responseCode: json['responseCode'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      totalPages: json['numPages'] as int?,
      afterId: json['afterId'] as String?,
    );

Map<String, dynamic> _$ServerListResponseToJson(ServerListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'numPages': instance.totalPages,
      'afterId': instance.afterId,
      'responseCode': instance.responseCode,
    };
