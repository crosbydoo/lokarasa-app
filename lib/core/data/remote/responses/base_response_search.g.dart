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

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
