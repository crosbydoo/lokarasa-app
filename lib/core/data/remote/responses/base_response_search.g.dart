// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseSearch<T> _$BaseResponseSearchFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponseSearch<T>(
      error: json['error'] as bool?,
      founded: json['founded'] as int?,
      restaurants: _$nullableGenericFromJson(json['restaurants'], fromJsonT),
    );

Map<String, dynamic> _$BaseResponseSearchToJson<T>(
  BaseResponseSearch<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error': instance.error,
      'founded': instance.founded,
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
