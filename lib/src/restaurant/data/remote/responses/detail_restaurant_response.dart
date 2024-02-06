import 'package:json_annotation/json_annotation.dart';

part 'detail_restaurant_response.g.dart';

@JsonSerializable()
class DetailRestaurantResponse {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "pictureId")
  final String? pictureId;
  @JsonKey(name: "categories")
  final List<Category>? categories;
  @JsonKey(name: "menus")
  final Menus? menus;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "customerReviews")
  final List<CustomerReview>? customerReviews;

  DetailRestaurantResponse({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menus,
    this.rating,
    this.customerReviews,
  });

  factory DetailRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailRestaurantResponseFromJson(json);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "name")
  final String? name;

  Category({
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@JsonSerializable()
class CustomerReview {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "review")
  final String? review;
  @JsonKey(name: "date")
  final String? date;

  CustomerReview({
    this.name,
    this.review,
    this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewFromJson(json);
}

@JsonSerializable()
class Menus {
  @JsonKey(name: "foods")
  final List<Category>? foods;
  @JsonKey(name: "drinks")
  final List<Category>? drinks;

  Menus({
    this.foods,
    this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => _$MenusFromJson(json);
}
