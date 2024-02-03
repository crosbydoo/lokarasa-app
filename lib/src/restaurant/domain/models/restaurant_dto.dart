class RestaurantDto {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  const RestaurantDto({
    this.id = '',
    this.name = '',
    this.description = '',
    this.pictureId = '',
    this.city = '',
    this.rating = 0.0,
  });

  @override
  String toString() {
    return 'RestaurantDto{id: $id, name: $name, description: $description, pictureId:$pictureId, city:$city, rating:$rating}';
  }
}
