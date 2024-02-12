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

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
