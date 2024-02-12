class DetailRestaurantDto {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<CategoryDto> categories;
  final MenusDto? menus;
  final double rating;
  final List<CustomerReviewDto> customerReviews;

  const DetailRestaurantDto({
    this.id = '',
    this.name = '',
    this.description = '',
    this.city = '',
    this.address = '',
    this.pictureId = '',
    this.categories = const [],
    this.menus,
    this.rating = 0.0,
    this.customerReviews = const [],
  });

  @override
  String toString() {
    return 'DetailRestaurantDto{id: $id,  name: $name, username:$name, description:$description, city:$city, categories:$categories,}';
  }
}

class CategoryDto {
  final String name;

  CategoryDto({
    this.name = '',
  });

  @override
  String toString() {
    return 'CategoryDto{ name$name }';
  }
}

class CustomerReviewDto {
  final String name;
  final String review;
  final String date;

  CustomerReviewDto({
    this.name = '',
    this.review = '',
    this.date = '',
  });

  @override
  String toString() {
    return 'CustomerReviewDto{ name$name, review:$review, date:$date }';
  }
}

class MenusDto {
  final List<CategoryDto> foods;
  final List<CategoryDto> drinks;

  const MenusDto({
    this.foods = const [],
    this.drinks = const [],
  });
  @override
  String toString() {
    return 'MenusDto{foods: $foods,  drinks: $drinks, }';
  }
}
