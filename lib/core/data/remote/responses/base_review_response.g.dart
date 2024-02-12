// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseReviewResponse<T> _$BaseReviewResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseReviewResponse<T>(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      customerReviews:
          _$nullableGenericFromJson(json['customerReviews'], fromJsonT),
    );

Map<String, dynamic> _$BaseReviewResponseToJson<T>(
  BaseReviewResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'customerReviews':
          _$nullableGenericToJson(instance.customerReviews, toJsonT),
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
