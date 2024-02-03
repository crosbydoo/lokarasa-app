import 'package:restaurant_app/core/data/remote/responses/base_response_pagination.dart';
import 'package:restaurant_app/core/utils/typedef_util.dart';
import 'package:restaurant_app/src/restaurant/data/remote/responses/restaurant_response.dart';

abstract class RestaurantRepository {
  FutureOrError<BasePaginationResponse<List<RestaurantResponse>>>
      getListRestaurant();
}
