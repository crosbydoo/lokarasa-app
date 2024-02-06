import 'package:either_dart/either.dart';
import 'package:restaurant_app/core/utils/typedef_util.dart';
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository.dart';
import 'package:restaurant_app/src/restaurant/domain/mapper/restaurant_mapper.dart';
import 'package:restaurant_app/src/restaurant/domain/models/detail_restaurant_dto.dart';

class GetDetailRestaurantUsecase {
  final RestaurantRepository _repository;

  GetDetailRestaurantUsecase(this._repository);

  FutureOrError<DetailRestaurantDto> execute({String? id}) {
    return _repository
        .getDetailRestaurant(
          id: id,
        )
        .mapRight((response) => response.restaurant.toDto());
  }
}
