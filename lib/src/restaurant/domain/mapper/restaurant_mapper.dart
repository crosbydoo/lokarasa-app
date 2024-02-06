import 'package:restaurant_app/src/restaurant/data/remote/responses/detail_restaurant_response.dart';
import 'package:restaurant_app/src/restaurant/data/remote/responses/restaurant_response.dart';
import 'package:restaurant_app/src/restaurant/domain/models/detail_restaurant_dto.dart';
import 'package:restaurant_app/src/restaurant/domain/models/restaurant_dto.dart';

extension RestaurantExt on RestaurantResponse? {
  RestaurantDto toDto() {
    return RestaurantDto(
      id: this?.id ?? '',
      city: this?.city ?? '',
      description: this?.description ?? '',
      name: this?.name ?? '',
      pictureId: this?.pictureId ?? '',
      rating: this?.rating ?? 0.0,
    );
  }
}

extension DetailRestaurantExt on DetailRestaurantResponse? {
  DetailRestaurantDto toDto() {
    List<CategoryDto> listCategory = [];
    List<CustomerReviewDto> listReview = [];

    MenusDto? menu;

    if (this?.categories != null) {
      for (var i = 0; i < this!.categories!.length; i++) {
        var data = this!.categories![i];
        listCategory.add(CategoryDto(name: data.name ?? ""));
      }
    }

    if (this?.customerReviews != null) {
      for (var i = 0; i < this!.customerReviews!.length; i++) {
        var data = this!.customerReviews![i];
        listReview.add(CustomerReviewDto(
          name: data.name ?? "",
          review: data.review ?? '',
          date: data.date ?? '',
        ));
      }
    }

    if (this?.menus != null) {
      var menusData = this!.menus!;
      List<CategoryDto> foods = [];
      List<CategoryDto> drinks = [];

      for (var i = 0; i < menusData.foods!.length; i++) {
        var foodData = menusData.foods![i];
        foods.add(CategoryDto(name: foodData.name!));
      }

      for (var i = 0; i < menusData.drinks!.length; i++) {
        var drinkData = menusData.drinks![i];
        drinks.add(CategoryDto(name: drinkData.name!));
      }

      menu = MenusDto(foods: foods, drinks: drinks);
    }

    return DetailRestaurantDto(
      id: this?.id ?? '',
      name: this?.name ?? '',
      description: this?.description ?? '',
      city: this?.city ?? '',
      address: this?.address ?? '',
      pictureId: this?.pictureId ?? '',
      rating: this?.rating ?? 0.0,
      customerReviews: listReview,
      menus: menu,
      categories: listCategory,
    );
  }
}
