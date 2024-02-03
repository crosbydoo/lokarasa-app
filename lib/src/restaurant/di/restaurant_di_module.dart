import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/src/restaurant/data/remote/services/restaurant_service.dart';
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository.dart';
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository_impl.dart';
import 'package:restaurant_app/src/restaurant/domain/usecases/get_restaurant_usecase.dart';

@module
abstract class RestaurantDiModule {
  @singleton
  RestaurantService service(Dio dio) => RestaurantService(dio);

  @Singleton(as: RestaurantRepository)
  RestaurantRepositoryImpl get restaurantRepository;

  @injectable
  GetRestaurantUsecase getRestaurantUsecase(RestaurantRepository repository) =>
      GetRestaurantUsecase(repository);
}
