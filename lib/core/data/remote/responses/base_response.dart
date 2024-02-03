import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'error')
  final bool? error;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'restaurant')
  final T? restaurant;

  BaseResponse({
    this.error,
    this.message,
    this.restaurant,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
