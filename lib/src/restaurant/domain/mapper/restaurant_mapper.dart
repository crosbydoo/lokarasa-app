import 'package:restaurant_app/src/restaurant/data/remote/responses/restaurant_response.dart';
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
