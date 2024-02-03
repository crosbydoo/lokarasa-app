import 'package:json_annotation/json_annotation.dart';

part 'base_response_pagination.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasePaginationResponse<T> {
  @JsonKey(name: 'error')
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'restaurants')
  final T? restaurants;

  BasePaginationResponse({
    this.status,
    this.message,
    this.count,
    this.restaurants,
  });

  factory BasePaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BasePaginationResponseFromJson(json, fromJsonT);
}
