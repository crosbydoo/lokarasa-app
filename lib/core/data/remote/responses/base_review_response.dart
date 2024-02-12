import 'package:json_annotation/json_annotation.dart';

part 'base_review_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseReviewResponse<T> {
  @JsonKey(name: 'error')
  final bool? error;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'customerReviews')
  final T? customerReviews;

  BaseReviewResponse({
    this.error,
    this.message,
    this.customerReviews,
  });

  factory BaseReviewResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseReviewResponseFromJson(json, fromJsonT);
}
