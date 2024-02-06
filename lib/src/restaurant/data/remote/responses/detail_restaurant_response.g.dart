// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_restaurant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRestaurantResponse _$DetailRestaurantResponseFromJson(
        Map<String, dynamic> json) =>
    DetailRestaurantResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      pictureId: json['pictureId'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      menus: json['menus'] == null
          ? null
          : Menus.fromJson(json['menus'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      customerReviews: (json['customerReviews'] as List<dynamic>?)
          ?.map((e) => CustomerReview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailRestaurantResponseToJson(
        DetailRestaurantResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'city': instance.city,
      'address': instance.address,
      'pictureId': instance.pictureId,
      'categories': instance.categories,
      'menus': instance.menus,
      'rating': instance.rating,
      'customerReviews': instance.customerReviews,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
    };

CustomerReview _$CustomerReviewFromJson(Map<String, dynamic> json) =>
    CustomerReview(
      name: json['name'] as String?,
      review: json['review'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$CustomerReviewToJson(CustomerReview instance) =>
    <String, dynamic>{
      'name': instance.name,
      'review': instance.review,
      'date': instance.date,
    };

Menus _$MenusFromJson(Map<String, dynamic> json) => Menus(
      foods: (json['foods'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      drinks: (json['drinks'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenusToJson(Menus instance) => <String, dynamic>{
      'foods': instance.foods,
      'drinks': instance.drinks,
    };
