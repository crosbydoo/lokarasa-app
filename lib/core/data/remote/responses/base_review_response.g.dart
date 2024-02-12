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

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
