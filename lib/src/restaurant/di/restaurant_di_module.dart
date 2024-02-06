import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/src/restaurant/data/remote/services/restaurant_service.dart';
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository.dart';
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository_impl.dart';
import 'package:restaurant_app/src/restaurant/domain/usecases/get_detail_restaurant_usecase.dart';
import 'package:restaurant_app/src/restaurant/domain/usecases/get_restaurant_usecase.dart';
import 'package:restaurant_app/src/restaurant/domain/usecases/search_restaurant_usecase.dart';

@module
abstract class RestaurantDiModule {
  @singleton
  RestaurantService service(Dio dio) => RestaurantService(dio);

  @Singleton(as: RestaurantRepository)
  RestaurantRepositoryImpl get restaurantRepository;

  @injectable
  GetRestaurantUsecase getRestaurantUsecase(RestaurantRepository repository) =>
      GetRestaurantUsecase(repository);

  @injectable
  GetDetailRestaurantUsecase getDetailRestaurantUsecase(
          RestaurantRepository repository) =>
      GetDetailRestaurantUsecase(repository);

  @injectable
  SearchRestaurantUsecase searchRestaurantUsecase(
          RestaurantRepository repository) =>
      SearchRestaurantUsecase(repository);
}
