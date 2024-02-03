import 'package:restaurant_app/core/data/remote/responses/base_response_pagination.dart';
import 'package:restaurant_app/core/utils/future_util.dart';
import 'package:restaurant_app/core/utils/typedef_util.dart';
import 'package:restaurant_app/src/restaurant/data/remote/responses/restaurant_response.dart';
import 'package:restaurant_app/src/restaurant/data/remote/services/restaurant_service.dart';
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository.dart';

class RestaurantRepositoryImpl extends RestaurantRepository {
  final RestaurantService _services;

  RestaurantRepositoryImpl(this._services);

  @override
  FutureOrError<BasePaginationResponse<List<RestaurantResponse>>>
      getListRestaurant() {
    return callOrError(
      () => _services.getListRestaurant(),
    );
  }
}
