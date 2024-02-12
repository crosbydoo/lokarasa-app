import 'package:restaurant_app/core/data/remote/responses/base_response.dart';
import 'package:restaurant_app/core/data/remote/responses/base_response_pagination.dart';
import 'package:restaurant_app/core/data/remote/responses/base_response_search.dart';
import 'package:restaurant_app/core/data/remote/responses/base_review_response.dart';
import 'package:restaurant_app/core/utils/typedef_util.dart';
import 'package:restaurant_app/src/restaurant/data/remote/requests/add_review_request.dart';
import 'package:restaurant_app/src/restaurant/data/remote/responses/detail_restaurant_response.dart';
import 'package:restaurant_app/src/restaurant/data/remote/responses/restaurant_response.dart';

abstract class RestaurantRepository {
  FutureOrError<BasePaginationResponse<List<RestaurantResponse>>>
      getListRestaurant();

  FutureOrError<BaseResponseSearch<List<RestaurantResponse>>> getSearchData({
    String? keyword,
  });

  FutureOrError<BaseResponse<DetailRestaurantResponse>> getDetailRestaurant({
    String? id,
  });

  FutureOrError<BaseReviewResponse<List<CustomerReview>>> addReview(
      AddReviewRequest addReviewRequest);
}
