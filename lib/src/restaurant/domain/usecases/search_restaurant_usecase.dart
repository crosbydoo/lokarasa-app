import 'package:either_dart/either.dart';
import 'package:restaurant_app/core/domain/models/base_response_search_dto.dart';
import 'package:restaurant_app/core/utils/typedef_util.dart';
import 'package:restaurant_app/src/restaurant/data/remote/responses/restaurant_response.dart';
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository.dart';
import 'package:restaurant_app/src/restaurant/domain/mapper/restaurant_mapper.dart';
import 'package:restaurant_app/src/restaurant/domain/models/restaurant_dto.dart';

class SearchRestaurantUsecase {
  final RestaurantRepository _repository;

  SearchRestaurantUsecase(this._repository);

  FutureOrError<BaseResponseSearchDto<RestaurantDto>> execute({
    int? founded = 20,
    String? keyword,
  }) {
    return _repository.getSearchData(keyword: keyword).mapRight((response) {
      var data = response.restaurants?.map(_mapDto).toList() ?? [];

      return BaseResponseSearchDto(
        restaurants: data,
        founded: data.length,
        error: false,
      );
    });
  }

  RestaurantDto _mapDto(RestaurantResponse response) {
    return response.toDto();
  }
}
