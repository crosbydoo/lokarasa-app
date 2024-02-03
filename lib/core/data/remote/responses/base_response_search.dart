import 'package:json_annotation/json_annotation.dart';

part 'base_response_search.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseSearch<T> {
  @JsonKey(name: 'error')
  final bool? error;
  @JsonKey(name: 'founded')
  final int? founded;
  @JsonKey(name: 'restaurants')
  final T? restaurants;

  BaseResponseSearch({
    this.error,
    this.founded,
    this.restaurants,
  });

  factory BaseResponseSearch.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseSearchFromJson(json, fromJsonT);
}
