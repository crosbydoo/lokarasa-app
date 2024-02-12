import 'package:json_annotation/json_annotation.dart';

part 'add_review_request.g.dart';

@JsonSerializable()
class AddReviewRequest {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "review")
  final String? review;

  AddReviewRequest({
    this.name,
    this.review,
    this.id,
  });

  factory AddReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$AddReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddReviewRequestToJson(this);
}
