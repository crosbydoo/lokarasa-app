import 'package:dio/dio.dart';
import 'package:restaurant_app/core/data/remote/responses/base_response.dart';
import 'package:restaurant_app/core/data/remote/responses/base_response_pagination.dart';
import 'package:restaurant_app/core/data/remote/responses/base_response_search.dart';
import 'package:restaurant_app/core/data/remote/responses/base_review_response.dart';
import 'package:restaurant_app/src/restaurant/data/remote/requests/add_review_request.dart';
import 'package:restaurant_app/src/restaurant/data/remote/responses/detail_restaurant_response.dart';
import 'package:restaurant_app/src/restaurant/data/remote/responses/restaurant_response.dart';
import 'package:retrofit/http.dart';

part 'restaurant_service.g.dart';

@RestApi()
abstract class RestaurantService {
  factory RestaurantService(Dio dio) => _RestaurantService(dio);

  @GET('/list')
  Future<BasePaginationResponse<List<RestaurantResponse>>> getListRestaurant();

  @GET('/search')
  Future<BaseResponseSearch<List<RestaurantResponse>>> getDataSearch(
    @Query('q') String? keyword,
  );

  @GET('/detail/{id}')
  Future<BaseResponse<DetailRestaurantResponse>> getDetailRestaurant({
    @Path('id') String? id,
  });

  @POST('/review')
  Future<BaseReviewResponse<List<CustomerReview>>> addReview(
    @Body() AddReviewRequest reviewRequest,
  );
}
