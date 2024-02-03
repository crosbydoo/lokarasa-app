import 'package:either_dart/either.dart';
import 'package:restaurant_app/core/utils/typedef_util.dart';
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository.dart';
import 'package:restaurant_app/src/restaurant/domain/mapper/restaurant_mapper.dart';
import 'package:restaurant_app/src/restaurant/domain/models/restaurant_dto.dart';

class GetRestaurantUsecase {
  final RestaurantRepository _repository;

  GetRestaurantUsecase(this._repository);

  FutureOrError<List<RestaurantDto>> execute() {
    return _repository.getListRestaurant().mapRight((response) {
      return response.restaurants!.map((e) => e.toDto()).toList();
    });
  }
}
