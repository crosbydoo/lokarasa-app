// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePaginationResponse<T> _$BasePaginationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasePaginationResponse<T>(
      status: json['error'] as bool?,
      message: json['message'] as String?,
      count: json['count'] as int?,
      restaurants: _$nullableGenericFromJson(json['restaurants'], fromJsonT),
    );

Map<String, dynamic> _$BasePaginationResponseToJson<T>(
  BasePaginationResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error': instance.status,
      'message': instance.message,
      'count': instance.count,
      'restaurants': _$nullableGenericToJson(instance.restaurants, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
