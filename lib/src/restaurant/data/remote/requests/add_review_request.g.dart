// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReviewRequest _$AddReviewRequestFromJson(Map<String, dynamic> json) =>
    AddReviewRequest(
      name: json['name'] as String?,
      review: json['review'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AddReviewRequestToJson(AddReviewRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'review': instance.review,
    };
